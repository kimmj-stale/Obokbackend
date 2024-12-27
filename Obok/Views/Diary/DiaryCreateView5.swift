//
//  DiaryCreateView5.swift
//  Obok
//
//  Created by 김민경 on 12/27/24.
//

import SwiftUI

struct DiaryCreateView5: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 5
    private let totalPages = 5
    @State private var explain2: String = ""
    private let maxTextLength = 150 // 글자 수 제한
    @State private var selectedTags: [String] = [] // 선택된 태그를 저장 (복수 선택)

    let dissTags = ["#상세한 계획 세우기", "#자신감", "#인간관계", "#수면부족", "#미루는 습관", "#부담감", "#스트레스"] // 태그 목록
    
    // 태그 열
        private let gridColumns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
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
                
        

                // 등록하기 버튼
                NavigationLink(destination: DiaryCreateView3()) {
                    Text("등록하기")
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

struct DiaryCreateView5_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateView5()
    }
}
