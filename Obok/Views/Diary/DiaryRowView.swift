//
//  DiaryRowView.swift
//  Obok
//
//  Created by 김민경 on 11/26/24.
//

import SwiftUI

struct DiaryRowView: View {
    let diary: Diary // Models/Diary.swift에서 정의된 Diary 사용

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(diary.title)
                .font(.headline)
                .foregroundColor(.black)

            Text("7. 공부한 내용 : \(diary.content)")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Text("마음")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("#열심히")
                    .font(.caption)
                    .foregroundColor(.blue)

                Spacer()

                Text("분량 \(diary.understandingLevel) 페이지")
                    .font(.caption)
                    .foregroundColor(.orange)

                Spacer()

                Text("이해도 \(diary.understandingLevel * 10)%")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 8)
    }
}
