//
//  DiaryCreateView4.swift
//  Obok
//
//  Created by 김민경 on 12/27/24.
//

import SwiftUI

struct DiaryCreateView4: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 4
    private let totalPages = 5
    @State private var explain2: String = ""
    private let maxTextLength = 150 // 글자 수 제한

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
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 10)

                    RoundedRectangle(cornerRadius: 8)
                        .fill(CustomColor.colors.first!) // 진행중인 부분 색상
                        .frame(width: CGFloat(currentPage) / CGFloat(totalPages) * (UIScreen.main.bounds.width - 48), height: 10)
                }
                .padding(.horizontal, 24)
                .padding(.top, 11)

                Spacer().frame(height: 40)
                
                // 공부 내용 작성 영역
                VStack(alignment: .leading) {
                    HStack {

                    Text("공부하면서 아쉬웠던 점은...")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    // 글자 수 제한 표시
                        Spacer()
                        Text("\(explain2.count) / \(maxTextLength)")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }

                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .frame(height: 160)

                        TextEditor(text: $explain2)
                            .onChange(of: explain2) { newValue in
                                if newValue.count > maxTextLength {
                                    explain2 = String(newValue.prefix(maxTextLength))
                                }
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
                            .font(.system(size: 15, weight: .regular))
                            .lineSpacing(12) // 160%보다 작게
//                            .lineSpacing(24) // 15px * 160% = 24px
                            .foregroundColor(.black)
                            .background(Color.clear)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 390)


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

struct DiaryCreateView4_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateView3()
    }
}
