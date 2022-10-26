//
//  DiaryTableViewCell.swift
//  My Diary
//
//  Created by Victor Kimpel on 22.08.22.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    let meetingName = UILabel(text: "", font: .appleSDGothicNeoBold20())
    let personName = UILabel(text: "", font: .appleSDGothicNeo20(), alignment: .right)
    let meetingTime = UILabel(text: "", font: .appleSDGothicNeoBold20())
    let typeLabel = UILabel(text: "Type:", font: .appleSDGothicNeo14(), alignment: .right)
    let meetingType = UILabel(text: "", font: .appleSDGothicNeoBold14())
    let addressLabel = UILabel(text: "Address:", font: .appleSDGothicNeo14(), alignment: .right)
    let meetingAddress = UILabel(text: "", font: .appleSDGothicNeoBold14())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: DiaryModel) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        meetingName.text = model.diaryName
        personName.text = model.diaryPerson
        guard let time = model.diaryTime else { return }
        meetingTime.text = dateFormatter.string(from: time)
        meetingType.text = model.diaryType
        meetingAddress.text = model.diaryAddress
        backgroundColor = UIColor().colorFromHex("\(model.diaryTag)")
        
    }
    
    func setConstraints() {
        let topStackView = UIStackView(arrangedSubviews: [meetingName, personName], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(meetingTime)
        NSLayoutConstraint.activate([
            meetingTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            meetingTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            meetingTime.widthAnchor.constraint(equalToConstant: 100),
            meetingTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel, meetingType, addressLabel, meetingAddress], axis: .horizontal, spacing: 5, distribution: .fillProportionally)
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: meetingTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
