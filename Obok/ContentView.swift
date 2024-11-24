//
//  ContentView.swift
//  Obok
//
//  Created by 김민경 on 11/24/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("메인")
                }

            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("통계")
                }

            CollectionView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("모아보기")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("설정")
                }
        }
    }
}
