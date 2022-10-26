//
//  ContactsOptionsTableViewController.swift
//  My Diary
//
//  Created by Victor Kimpel on 2.09.22.
//

import UIKit

class ContactsOptionsTableViewController: UITableViewController {
    
    private let idOptionsContactCell = "idOptionsContactCell"
    private let idOptionsContactHeader = "idOptionsContactHeader"
    
    private let headerNameArray = ["NAME", "PHONE", "MAIL", "CATEGORY", "ADD IMAGE"]
    var cellNameArray = ["Name", "Phone", "Mail", "Category", ""]
    
    var imageIsChanged = false
    var contactModel = ContactModel()
    var editModel = false
    var dataImage: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Contact"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "fon"))
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsContactCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsContactHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(saveButtonTapped))
        print(contactModel)
    }
    
    @objc private func saveButtonTapped() {
        
        if cellNameArray[0] == "Name" || cellNameArray[3] == "Category" {
            alertOk(title: "Error", message: "Fill in required fields: NAME and CATEGORY")
        } else if editModel == false {
            setImageModel()
            setModel()
            RealmManager.shared.saveContactModel(model: contactModel)
            contactModel = ContactModel()
            
            cellNameArray = ["Name", "Phone", "Mail", "Category", ""]
            alertOk(title: "Saved successfully", message: nil)
            tableView.reloadData()
        } else {
            setImageModel()
            RealmManager.shared.updateContactModel(model: contactModel, nameArray: cellNameArray, imageData: dataImage)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setModel() {
        contactModel.contactsName = cellNameArray[0]
        contactModel.contactsPhone = cellNameArray[1]
        contactModel.contactsMail = cellNameArray[2]
        contactModel.contactsCategory = cellNameArray[3]
        contactModel.contactsImage = dataImage
    }
    
    @objc private func setImageModel() {
        
        if imageIsChanged {
            let cell = tableView.cellForRow(at: [4,0]) as! OptionsTableViewCell
            
            let image = cell.backgroundViewCell.image
            guard let imageData = image?.pngData() else { return }
            dataImage = imageData
            
            cell.backgroundViewCell.contentMode = .scaleAspectFit
            imageIsChanged = false
        } else {
            dataImage = nil
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsContactCell, for: indexPath) as! OptionsTableViewCell
        
        if editModel == false {
            cell.cellContactsConfigure(nameArray: cellNameArray, indexPath: indexPath, image: nil)
        } else if let data = contactModel.contactsImage, let image = UIImage(data: data) {
            cell.cellContactsConfigure(nameArray: cellNameArray, indexPath: indexPath, image: image)
        } else {
            cell.cellContactsConfigure(nameArray: cellNameArray, indexPath: indexPath, image: nil)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 4 ? 200 : 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsContactHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        24
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertForCellName(label: cell.nameCellLabel, name: "Name Contact", placeholder: "Enter contact name") { text in
            self.cellNameArray[0] = text
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Phone Contact", placeholder: "Enter contact phone number") { text in
            self.cellNameArray[1] = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Email Contact", placeholder: "Enter contact email") { text in
            self.cellNameArray[2] = text
        }
        case 3: alertCategory(label: cell.nameCellLabel) { category in
            self.cellNameArray[3] = category
        }
        case 4: alertPhotoOrCamera { [self] source in
            chooseImagePicker(source: source)
        }
        default:
            print("Tap ContactTableView")
        }
    }
}

extension ContactsOptionsTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let cell = tableView.cellForRow(at: [4,0]) as! OptionsTableViewCell
        cell.backgroundViewCell.image = info[.editedImage] as? UIImage
        cell.backgroundViewCell.contentMode = .scaleAspectFill
        cell.backgroundViewCell.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}

