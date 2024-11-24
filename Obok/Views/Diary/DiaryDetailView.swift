//
//  DiaryDetailView.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

// 특정 일기의 상세 내용

import SwiftUI

struct DiaryDetailView: View {
    let diary: Diary // 전달된 Diary 객체

    var body: some View {
        VStack(alignment: .leading) {
            Text(diary.title)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 10)

            Text("작성일: \(diary.date, formatter: dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("내용:")
                .font(.headline)
                .padding(.top, 10)
            Text(diary.content)
                .padding(.top, 5)

            Spacer()
        }
        .padding()
        .navigationTitle("일기 상세보기")
    }

    // 날짜 형식 지정
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}
