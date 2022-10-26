//
//  TagsTableViewCell.swift
//  My Diary
//
//  Created by Victor Kimpel on 28.08.22.
//

import UIKit

class TagsTableViewCell: UITableViewCell {
    
    let backgroundViewCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfigure(indexPath: IndexPath) {
        switch indexPath.section {
        case 0: backgroundViewCell.backgroundColor = #colorLiteral(red: 1, green: 0.286916852, blue: 0.272269398, alpha: 1)
        case 1: backgroundViewCell.backgroundColor = #colorLiteral(red: 1, green: 0.6234584451, blue: 0, alpha: 1)
        case 2: backgroundViewCell.backgroundColor = #colorLiteral(red: 1, green: 0.87280792, blue: 0, alpha: 1)
        case 3: backgroundViewCell.backgroundColor = #colorLiteral(red: 0, green: 0.953964889, blue: 0.07749583572, alpha: 1)
        case 4: backgroundViewCell.backgroundColor = #colorLiteral(red: 0, green: 0.6029673815, blue: 1, alpha: 1)
        case 5: backgroundViewCell.backgroundColor = #colorLiteral(red: 0.9039561749, green: 0.4148265719, blue: 1, alpha: 1)
        case 6: backgroundViewCell.backgroundColor = #colorLiteral(red: 0.5716609359, green: 0.5766358376, blue: 0.6194379926, alpha: 1)
        default:
            backgroundViewCell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func setConstraints() {
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
    }
}

