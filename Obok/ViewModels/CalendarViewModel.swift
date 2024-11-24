//
//  CalendarView.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date // 선택된 날짜 바인딩

    var body: some View {
        VStack {
            Text("달력 구성")
                .font(.headline)
                .padding()
            Text("선택된 날짜: \(selectedDate, formatter: dateFormatter)")
        }
    }

    // 날짜 형식 지정
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
}
