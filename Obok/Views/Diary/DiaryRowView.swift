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
        let color = CustomColor.colors[diary.colorIndex] // 일기 색상 지정

        VStack(alignment: .leading, spacing: 8) {
            Text(diary.title)
                .font(.headline)
                .foregroundColor(.black)

            Text("7. 공부한 내용 : \(diary.content)")
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding(.leading, 10)

            HStack {
                Text("마음")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Spacer()
                
                Text("분량")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Spacer()
                
                Text("이해도")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)

            HStack {
                Text("#열심히")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(color)
                Spacer()
                
                Text("\(diary.understandingLevel) 페이지")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(color)
                Spacer()
                
                Text("\(diary.understandingLevel * 10)%")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(color)

                HStack(spacing: 4) {
                    ForEach(0..<5) { index in
                        Circle()
                            .strokeBorder(color, lineWidth: 1)
                            .background(
                                Circle()
                                    .foregroundColor(index < filledCirclesCount() ? color : .clear)
                            )
                            .frame(width: 9, height: 9)
                    }
                }
            }
            .padding(.leading, 10)
        }
        .padding(.vertical, 8)
    }

    // 이해도에 맞게 색칠된 동그라미 수 계산
    private func filledCirclesCount() -> Int {
        if diary.understandingLevel >= 80 {
            return 0
        } else if diary.understandingLevel >= 60 {
            return 1
        } else if diary.understandingLevel >= 40 {
            return 2
        } else if diary.understandingLevel >= 20 {
            return 3
        } else {
            return 4
        }
    }
}
