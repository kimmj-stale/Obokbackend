//
//  DiaryDetailView.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

// 특정 일기의 상세 내용

import SwiftUI

struct DiaryDetailView: View {
    var diary: Diary

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("일기")
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
