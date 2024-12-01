//
//  DiaryCreateView.swift
//  Obok
//
//  Created by 김민경 on 12/1/24.
//

// 새 일기 생성 - 단계별 템플릿 제공

import SwiftUI

struct DiaryCreateView: View {
    @Environment(\.presentationMode) var presentationMode // 화면을 닫기 위한 환경 변수
    @State private var currentPage = 1
    private let totalPages = 5

    var body: some View {
        VStack {
            // 상단 네비게이션 영역
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
                }) {
                    Image("backbutton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }

                Spacer()

                Text("학습일기 작성하기")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                Text("\(currentPage) / \(totalPages)")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
            .padding([.top, .horizontal], 18)

            // 학습일기 작성하기 상단 바
            ProgressView(value: Double(currentPage), total: Double(totalPages))
                .progressViewStyle(LinearProgressViewStyle(tint: CustomColor.colors.first!))
                .frame(height: 8)
                .padding([.top, .horizontal], 16)
            
            Spacer()
        }
        .navigationBarHidden(true) // 기본 네비게이션 바 숨기기
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateView()
    }
}
