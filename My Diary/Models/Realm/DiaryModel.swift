//
//  DiaryModel.swift
//  My Diary
//
//  Created by Victor Kimpel on 5.09.22.
//

import RealmSwift

class DiaryModel: Object {
    
    @Persisted var diaryDate: Date?
    @Persisted var diaryTime: Date?
    @Persisted var diaryName: String = "Here can be your advertising"
    @Persisted var diaryType: String = "Here can be your advertising"
    @Persisted var diaryAddress: String = "Here can be your advertising"
    @Persisted var diaryPerson: String = "Here can be your advertising"
    @Persisted var diaryTag: String = "1F77DB"
    @Persisted var diaryRepeat: Bool = true
    @Persisted var diaryWeekday: Int = 1
}
