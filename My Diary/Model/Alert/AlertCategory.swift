//
//  AlertCategory.swift
//  My Diary
//
//  Created by Victor Kimpel on 3.09.22.
//

import UIKit

extension UIViewController {
    
    func alertCategory(label: UILabel, completionHandler: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let family = UIAlertAction(title: "Family", style: .default) { _ in
            label.text = "Family"
            let categoryContact = "Family"
            completionHandler(categoryContact)
        }
        
        let friends = UIAlertAction(title: "Friends", style: .default) { _ in
            label.text = "Friends"
            let categoryContact = "Friends"
            completionHandler(categoryContact)
        }
        
        let business = UIAlertAction(title: "Business", style: .default) { _ in
            label.text = "Business"
            let categoryContact = "Business"
            completionHandler(categoryContact)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(family)
        alertController.addAction(friends)
        alertController.addAction(business)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}
