//
//  MainView.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

// 주차별 달력과 오늘 일기 목록 표시

import SwiftUI

struct MainView: View {
    @State private var selectedDate = Date() // 선택된 날짜
    @State private var todayDiaries: [Diary] = [] // 오늘의 일기 목록
    @State private var showCreateView = false // DiaryCreateView로 이동 여부

    var body: some View {
        ZStack {
            VStack {
                // 달력 뷰
                CalendarView(selectedDate: $selectedDate)
                    .frame(height: 300) // 달력 크기 지정

                // 오늘 일기 목록
                VStack(alignment: .leading, spacing: 8) {
                    Text("오늘 일기")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.horizontal, 16)
                        .padding(.top, 15)

                    List(todayDiaries.indices, id: \.self) { index in
                        NavigationLink(destination: DiaryDetailView(diary: todayDiaries[index])) {
                            HStack(spacing: 8) {
                                // 과목별 색상 표시
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(CustomColor.colors[index % CustomColor.colors.count]) // 색상 순환
                                    .frame(width: 8, height: 24)
                                    .padding(.bottom, 70)
                        
                                // 일기 정보 표시
                                DiaryRowView(diary: todayDiaries[index])
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(CustomColor.colors.last!) // CustomColor.swift의 마지막 색깔 사용
                .padding(.bottom, 10)
            }

            // createbutton.png
            VStack {
                Spacer()

                HStack {
                    Spacer()

                    Button(action: {
                        showCreateView.toggle() // DiaryCreateView로 이동
                    }) {
                        Image("creatediary") // 버튼 이미지
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 56) // 버튼 크기
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                    .padding(.trailing, 24)
                    .padding(.bottom, 24)
                    .sheet(isPresented: $showCreateView) {
                        DiaryCreateView() // Diary 작성 뷰로 이동
                    }
                }
            }
        }
        .onAppear {
            loadTodayDiaries()
        }
    }

    // 오늘 일기 데이터를 불러오는 메서드
    func loadTodayDiaries() {
        todayDiaries = []

        // 샘플 데이터 생성 (추후 데이터베이스 연동 필요)
        let titles = ["수학 복습", "사회 복습", "영어 단어 암기"]
        let contents = ["미적분 복습", "역사 정리", "단어 20개 복습"]
        let subjects = ["수학", "사회", "영어"]
        let understandingLevels = [100, 80, 60]

        for (index, title) in titles.enumerated() {
            let diary = Diary(
                id: UUID(),
                date: Date(),
                title: title,
                content: contents[index],
                subject: subjects[index],
                understandingLevel: understandingLevels[index],
                colorIndex: index % CustomColor.colors.count // 색상 인덱스를 순차적으로 할당
            )
            todayDiaries.append(diary)
        }
    }
}
