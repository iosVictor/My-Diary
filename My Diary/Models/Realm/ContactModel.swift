//
//  ContactModel.swift
//  My Diary
//
//  Created by Victor Kimpel on 9.09.22.
//

import RealmSwift

class ContactModel: Object {
    
    @Persisted var contactsName = "Here can be your advertising"
    @Persisted var contactsPhone = "Here can be your advertising"
    @Persisted var contactsMail = "Here can be your advertising"
    @Persisted var contactsCategory = "Here can be your advertising"
    @Persisted var contactsImage: Data?
}
