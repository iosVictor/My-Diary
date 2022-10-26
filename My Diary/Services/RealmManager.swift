//
//  RealmManager.swift
//  My Diary
//
//  Created by Victor Kimpel on 5.09.22.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    //DiaryModel
    
    func saveDiaryModel(model: DiaryModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteDiaryModel(model: DiaryModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    //TaskModel
    
    func saveTaskModel(model: TaskModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteTaskModel(model: TaskModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func updateReadyButtonTaskModel(task: TaskModel, bool: Bool) {
        try! localRealm.write {
            task.taskReady = bool
        }
    }
    
    //ContactModel
    
    func saveContactModel(model: ContactModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteContactModel(model: ContactModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func updateContactModel(model: ContactModel, nameArray: [String], imageData: Data?) {
        try! localRealm.write {
            model.contactsName = nameArray[0]
            model.contactsPhone = nameArray[1]
            model.contactsMail = nameArray[2]
            model.contactsCategory = nameArray[3]
            model.contactsImage = imageData
        }
    }
}
