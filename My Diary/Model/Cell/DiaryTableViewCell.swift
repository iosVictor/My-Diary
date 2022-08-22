//
//  DiaryTableViewCell.swift
//  My Diary
//
//  Created by Victor Kimpel on 22.08.22.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    let meetingName = UILabel(text: "Программирование", font: .avenirNextDemiBold20())
    let personName = UILabel(text: "Таран Женя", font: .avenirNext20(), alignment: .right)
    let meetingTime = UILabel(text: "19:00", font: .avenirNextDemiBold20())
    let typeLabel = UILabel(text: "Тип:", font: .avenirNext14(), alignment: .right)
    let meetingType = UILabel(text: "Учение АйТи", font: .avenirNextDemiBold14())
    let addressLabel = UILabel(text: "Адрес:", font: .avenirNext14(), alignment: .right)
    let meetingAddress = UILabel(text: "Где угодно, в Zoom", font: .avenirNextDemiBold14())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
