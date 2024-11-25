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

    var body: some View {
        VStack {
            CalendarView(selectedDate: $selectedDate)
//                .frame(height: 300)
        }
    }
}
