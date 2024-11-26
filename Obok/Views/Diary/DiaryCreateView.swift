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
                
            }
        }
    }
    
}
