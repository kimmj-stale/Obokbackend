//
//  StatisticsViewModel.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

// 통계 데이터를 대시보드 형식으로 표시

import SwiftUI

struct StatisticsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("통계 대시보드")
                    .font(.largeTitle)

                // 통계
                StatisticCardView(title: "공부 시간", value: "15시간")
                StatisticCardView(title: "가장 많이 작성한 과목", value: "수학")
            }
            .padding()
        }
    }
}

// 통계 카드 컴포넌트
struct StatisticCardView: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(value)
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}
