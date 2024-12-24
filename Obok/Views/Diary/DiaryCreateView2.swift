//
//  DiaryCreateView2.swift
//  Obok
//
//  Created by 김민경 on 12/24/24.
//

// 새 일기 생성 - 단계별 템플릿 제공 - 2

import SwiftUI

struct DiaryCreateView2: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 1
    private let totalPages = 5
    @State private var understand: String = ""
    @State private var selectedTag: String? = nil // 선택된 태그를 저장

    let tags = ["#가볍게", "#적당히", "#보통", "#열심히"] // 태그 목록

    var body: some View {
        ZStack {
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

                // 페이지 입력 영역
                HStack {
                    Text("오늘 공부는")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        .frame(width: 70, height: 25)
                        .overlay(
                            TextField("", text: $understand)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 16))
                        )
                    Text("% 잘 이해했다고 생각해요")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 40)

                // 태그 선택 영역
                VStack(alignment: .leading) {
                    Text("이런 마음으로 공부했어요")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 8)

                    // 태그 버튼
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(tags, id: \.self) { tag in
                                Button(action: {
                                    selectedTag = tag // 태그 선택
                                }) {
                                    Text(tag)
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(selectedTag == tag ? CustomColor.colors.first! : Color.gray, lineWidth: 2)
                                        )
                                }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                }
                .padding(.bottom, 320)

                Spacer()

                // 다음으로 버튼
                NavigationLink(destination: DiaryCreateView2()) {
                    Text("다음으로")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 20)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct DiaryCreateView2_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateView2()
    }
}
