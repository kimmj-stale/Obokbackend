//
//  DiaryCreateView.swift
//  Obok
//
//  Created by 김민경 on 11/24/24.
//

// 새 일기 생성 - 단계별 템플릿 제공

import SwiftUI

struct DiaryCreateView: View {
    @State private var step = 1 // 현재 단계
    @State private var title = ""
    @State private var subject = ""
    @State private var understandingLevel = 5
    @State private var content = ""
    @State private var distractions = [String]()
    @State private var improvements = [String]()

    var body: some View {
        VStack {
            Text("일기 작성 - 단계 \(step)")
                .font(.headline)

            // 단계별 뷰 전환
            if step == 1 {
                TextField("제목 입력", text: $title)
                    .textFieldStyle(.roundedBorder)
            } else if step == 2 {
                TextField("과목 입력", text: $subject)
                    .textFieldStyle(.roundedBorder)
            } else if step == 3 {
                Stepper("이해도: \(understandingLevel)", value: $understandingLevel, in: 1...10)
            } else if step == 4 {
                TextEditor(text: $content)
                    .border(Color.gray, width: 1)
            } else if step == 5 {
                MultiSelectView(options: ["소음", "피로", "인터넷"], selectedItems: $distractions)
            } else if step == 6 {
                MultiSelectView(options: ["계획 부족", "시간 관리", "집중 부족"], selectedItems: $improvements)
            }

            Spacer()

            // 다음 단계 버튼
            Button(step < 6 ? "다음" : "완료") {
                if step < 6 {
                    step += 1
                } else {
                    saveDiary()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    // 새 일기를 저장하는 메서드
    func saveDiary() {
        // Diary 저장 로직 (데이터베이스 연동 필요)
        print("새 일기 저장 완료!")
    }
}

// 다중 선택을 위한 커스텀 뷰
struct MultiSelectView: View {
    let options: [String]
    @Binding var selectedItems: [String]

    var body: some View {
        VStack {
            ForEach(options, id: \.self) { option in
                Toggle(option, isOn: Binding(
                    get: { selectedItems.contains(option) },
                    set: { isSelected in
                        if isSelected {
                            selectedItems.append(option)
                        } else {
                            selectedItems.removeAll { $0 == option }
                        }
                    }
                ))
            }
        }
    }
}
