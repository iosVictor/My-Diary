//
//  TasksModel.swift
//  My Diary
//
//  Created by Victor Kimpel on 9.09.22.
//

import RealmSwift

class TaskModel: Object {
    
    @Persisted var taskDate: Date?
    @Persisted var taskName: String = "Here can be your advertising"
    @Persisted var taskDescription: String = "Here can be your advertising"
    @Persisted var taskTag: String = "1F77DB"
    @Persisted var taskReady: Bool = false
}
