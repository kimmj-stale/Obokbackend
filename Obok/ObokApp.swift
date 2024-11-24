//
//  ObokApp.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

import SwiftUI

@main
struct ObookApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @StateObject private var userViewModel = UserViewModel() // 사용자 상태 관리
    @StateObject private var diaryViewModel = DiaryViewModel() // 일기 관리 상태

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
                .environmentObject(diaryViewModel)
        }
    }
}
