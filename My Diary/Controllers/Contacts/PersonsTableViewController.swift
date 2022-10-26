//
//  PersonsViewController.swift
//  My Diary
//
//  Created by Victor Kimpel on 28.08.22.
//

import UIKit
import RealmSwift

class PersonsTableViewController: UITableViewController {
    
    private let localRealm = try! Realm()
    private var contactsArray: Results<ContactModel>!
    private let personId = "personId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Persons"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: personId)
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "fon"))
        
        contactsArray = localRealm.objects(ContactModel.self).filter("contactsCategory = 'Business'")
    }
    
    private func setBusiness(business: String) {
        let diaryOptions = self.navigationController?.viewControllers[1] as? DiaryOptionsTableViewController
        diaryOptions?.diaryModel.diaryPerson = business
        diaryOptions?.cellNameArray[2][0] = business
        diaryOptions?.tableView.reloadRows(at: [[2,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: personId, for: indexPath) as! ContactsTableViewCell
        cell.backgroundView = UIImageView(image: #imageLiteral(resourceName: "fon"))
        let model = contactsArray[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = contactsArray[indexPath.row]
        setBusiness(business: model.contactsName)
    }
}
