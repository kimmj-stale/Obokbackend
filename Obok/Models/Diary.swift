//
//  Diary.swift
//  Obok
//
//  Created by 김민경 on 11/23/ㅊ24.
//

// 일기 데이터를 정의

import Foundation

struct Diary: Identifiable {
    let id: UUID
    let date: Date
    let title: String
    let content: String
    let subject: String
    let pageCount: Int
    let understandingLevel: Int
    let colorIndex: Int

    init(id: UUID, date: Date, title: String, content: String, subject: String, pageCount: Int, understandingLevel: Int, colorIndex: Int) {
        self.id = id
        self.date = date
        self.title = title
        self.content = content
        self.subject = subject
        self.pageCount = pageCount
        self.understandingLevel = understandingLevel
        self.colorIndex = colorIndex
    }
}
