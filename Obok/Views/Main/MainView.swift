//
//  MainView.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

// 메인 화면 - 주차별 달력과 오늘 일기 목록 표시

import SwiftUI

struct MainView: View {
    @State private var selectedDate = Date() // 선택된 날짜
    @State private var todayDiaries: [Diary] = [] // 오늘의 일기 목록

    var body: some View {
        VStack {
            // 달력 뷰
            CalendarView(selectedDate: $selectedDate)
                .frame(height: 300) // 달력 크기 지정

            // 오늘 일기 목록
            List(todayDiaries) { diary in
                NavigationLink(destination: DiaryDetailView(diary: diary)) {
                    Text(diary.title) // 일기 제목 표시
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("메인 화면")
        .onAppear {
            loadTodayDiaries()
        }
    }

    // 오늘 일기 데이터를 불러오는 메서드
    func loadTodayDiaries() {
        // 샘플 데이터 로드 (추후 데이터베이스 연동 필요)
        todayDiaries = [
            Diary(id: UUID(), date: Date(), title: "수학 복습", content: "미적분 복습", subject: "수학", understandingLevel: 8, distractions: [], improvements: [])
        ]
    }
}
