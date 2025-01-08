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
    @State private var selectedTags: [String] = [] // 선택된 태그를 저장 (복수 선택)

    let dissTags = ["#해당없음", "#수면부족", "#미루는습관", "#집중력부족", "#체력부족", "#스트레스", "#무기력", "#개념부족", " #이해안됨", "#응용력부족", "#암기어려움", "#풀이어려움", "#소음", "#공부공간부족", "#휴대폰", "#인터넷게임", "#인간관계", "#부담감"] // 태그 목록
    
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
                            .frame(maxWidth: .infinity, maxHeight: 140) // 텍스트 크기 제한
                            .clipped() // 텍스트가 박스 밖으로 넘어가지 않도록 자르기
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 50)

                // 태그 선택 영역
                VStack(alignment: .leading) {
                    HStack {
                        Text("이런 이유 때문에 아쉬웠어요.")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                        Text("복수선택")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 8)
                    
                    // 모든 태그 버튼 표시
                    LazyVGrid(columns: gridColumns, spacing: 12) {
                        ForEach(dissTags, id: \.self) { tag in
                            Button(action: {
                                if tag == "#해당없음" {
                                    // '해당 없음' 선택 시 다른 태그 초기화
                                    if selectedTags.contains("#해당없음") {
                                        selectedTags.removeAll()
                                    } else {
                                        selectedTags = ["#해당없음"]
                                    }
                                } else {
                                    // 다른 태그 선택 시 '해당없음' 제거
                                    selectedTags.removeAll { $0 == "#해당없음" }
                                    if selectedTags.contains(tag) {
                                        selectedTags.removeAll { $0 == tag }
                                    } else {
                                        selectedTags.append(tag)
                                    }
                                }
                            }) {
                                Text(tag)
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedTags.contains(tag) ? CustomColor.colors.first! : Color.gray.opacity(0.2))

                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 40)
                }

                // 다음으로 버튼
                NavigationLink(destination: DiaryCreateView5()) {
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
        DiaryCreateView4()
    }
}
