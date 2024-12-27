//
//  DiaryCreateView.swift
//  Obok
//
//  Created by 김민경 on 12/1/24.
//

// 새 일기 생성 - 단계별 템플릿 제공 - 1

import SwiftUI

struct DiaryCreateView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 1
    private let totalPages = 5
    @State private var subjects: [String] = []
    @State private var isShowingModal = false
    @State private var pageText: String = ""
    @State private var isShowingAlert = false

    let maxSubjects = 15

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

                Spacer().frame(height: 40)

                Text("저는 오늘 이 과목을 공부했어요!")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal, 25)

                // 과목 버튼 영역
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 100, maximum: 150), spacing: 10)
                    ],
                    spacing: 10
                ) {
                    ForEach(0..<min(subjects.count, maxSubjects), id: \.self) { index in
                        let color = CustomColor.colors[index % (CustomColor.colors.count - 1)]
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color)
                                .frame(width: 10, height: 10)
                            Text(subjects[index])
                                .font(.system(size: 16))
                                .lineLimit(1)
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)
                                .fixedSize(horizontal: false, vertical: false)
                        }
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(color, lineWidth: 2)
                        )
                    }

                    // 새 과목 추가 버튼
                    if subjects.count < maxSubjects {
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
                        }
                    } else {
                        Text("더 이상 과목을 추가할 수 없습니다. 과목 숨기기로 필요 없는 과목을 숨겨주세요.")
                            .font(.system(size: 14))
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil) // 줄임표 방지
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal, 25)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 30)

                // 페이지 입력 영역
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        .frame(width: 70, height: 30)
                        .overlay(
                            TextField("", text: $pageText)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 16))
                        )
                    Text("페이지 공부했어요")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 25)

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

            // Modal
            if isShowingModal {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isShowingModal = false // 배경을 탭하면 모달 닫기
                    }

                AddSubjectModal(isShowingModal: $isShowingModal, onAddSubject: { newSubject in
                    if subjects.count < maxSubjects {
                        subjects.append(newSubject)
                    }
                })
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 180)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .navigationBarHidden(true)
    }
}

struct FlowLayout<Content: View>: View {
    let spacing: CGFloat
    let content: [Content]

    init(spacing: CGFloat = 8, @ViewBuilder content: () -> [Content]) {
        self.spacing = spacing
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = 0
        var height: CGFloat = 0

        return ZStack(alignment: .topLeading) {
            ForEach(0..<self.content.count, id: \.self) { index in
                self.content[index]
                    .padding(.horizontal, self.spacing)
                    .alignmentGuide(.leading) { d in
                        if width + d.width > geometry.size.width {
                            width = 0
                            height -= d.height + self.spacing
                        }
                        let result = width
                        width += d.width
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        return result
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateView()
    }
}
