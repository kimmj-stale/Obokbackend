//
//  ObokApp.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

import SwiftUI

@main
struct ObokApp: App {
    @State private var selectedDate = Date() // 현재 날짜를 기본값으로 설정

    var body: some Scene {
        WindowGroup {
            CalendarView(selectedDate: $selectedDate) // CalendarView로 바로 진입
        }
    }
}
