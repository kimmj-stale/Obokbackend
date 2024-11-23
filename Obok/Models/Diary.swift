//
//  Diary.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

// 일기 데이터를 정의

import Foundation

struct Diary: Identifiable {
    let id: UUID // 고유 식별자
    var date: Date // 일기 작성 날짜
    var title: String // 일기 제목
    var content: String // 일기 내용
    var subject: String // 과목
    var understandingLevel: Int // 이해도 (1~10)
    var distractions: [String] // 공부 방해 요인
    var improvements: [String] // 아쉬운 점
}
