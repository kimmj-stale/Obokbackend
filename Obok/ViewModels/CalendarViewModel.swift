//
//  CalendarView.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var selectedDate: Date
    @Published var weekDates: [Date] = []
    @Published var studyData: [Date: [Color]] = [:]

    init(selectedDate: Date) {
        self.selectedDate = selectedDate
        loadWeekDates()
        loadStudyData()
    }

    func loadWeekDates() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: selectedDate)

        guard let monday = calendar.date(from: components) else { return }
        weekDates = (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: monday)
        }
    }

    func loadStudyData() {
        let calendar = Calendar.current
        studyData = [
            calendar.date(byAdding: .day, value: 0, to: selectedDate)!: [.red, .blue, .orange],
            calendar.date(byAdding: .day, value: 1, to: selectedDate)!: [.green],
            calendar.date(byAdding: .day, value: 2, to: selectedDate)!: [.purple, .pink],
            calendar.date(byAdding: .day, value: 3, to: selectedDate)!: []
        ]
    }

    func changeWeek(by offset: Int) {
        let calendar = Calendar.current
        if let newDate = calendar.date(byAdding: .weekOfYear, value: offset, to: selectedDate) {
            selectedDate = newDate
            loadWeekDates()
        }
    }

    func dayOfWeek(for date: Date) -> String {
        let weekdaySymbols = ["월", "화", "수", "목", "금", "토", "일"]
        let calendar = Calendar.current
        let weekdayIndex = calendar.component(.weekday, from: date) - 2
        return weekdaySymbols[(weekdayIndex + 7) % 7]
    }

    func day(for date: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }

    func colorForWeekday(_ date: Date) -> Color {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        if weekday == 7 { return .blue } // 토요일
        if weekday == 1 { return .red }  // 일요일
        return .primary
    }
}
