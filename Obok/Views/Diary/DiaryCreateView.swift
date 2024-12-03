//
//  DiaryCreateView.swift
//  Obok
//
//  Created by 김민경 on 12/1/24.
//

// 새 일기 생성 - 단계별 템플릿 제공

import SwiftUI

struct DiaryCreateView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 1
    private let totalPages = 5
    @State private var subjects: [String] = []
    @State private var isShowingModal = false

    var body: some View {
        VStack(alignment: .leading) {
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
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                Text("\(currentPage) / \(totalPages)")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
            .padding([.top, .horizontal], 24)

            // 학습일기 작성하기 상단 바
            ZStack(alignment: .leading) {
                // 전체 길이
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 10)

                // 현재 진행된 부분
                RoundedRectangle(cornerRadius: 8)
                    .fill(CustomColor.colors.first!) // 진행중인 부분 색상
                    .frame(width: CGFloat(currentPage) / CGFloat(totalPages) * (UIScreen.main.bounds.width - 48), height: 10)
            }
            .padding(.horizontal, 24)
            .padding(.top, 11)

            Spacer().frame(height: 84)

            Text("저는 오늘 이 과목을 공부했어요!")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 25)

            // 과목 버튼 영역
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    // 각 과목 버튼
                    // '+ 새 과목 추가' 버튼
                    Button(action: {
                        isShowingModal = true
                    }) {
                        HStack {
                            Text("+ 새 과목 추가")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .padding(.horizontal, 4)
                        }
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray))
                        .padding(.top, 25)
                    }
                    .sheet(isPresented: $isShowingModal) {
                        AddSubjectModal(isShowingModal: $isShowingModal)
                    }
                }
                .padding(.horizontal, 25)
            }
            .padding(.top, 16)

            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateView()
    }
}

