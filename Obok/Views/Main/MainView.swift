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
                                    .fill(CustomColor.colors[todayDiaries[index].colorIndex]) // 색상 순환
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

                    NavigationLink(destination: DiaryCreateView()) {
                        Image("creatediary") // 버튼 이미지
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 56) // 버튼 크기
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                    .padding(.trailing, 24)
                    .padding(.bottom, 24)
                }
            }
        }
        .onAppear {
            loadTodayDiaries()
        }
        .navigationBarHidden(true)
    }


    // 오늘 일기 데이터를 불러오는 메서드
    func loadTodayDiaries() {
        todayDiaries = []

        // 샘플 데이터 생성 (추후 데이터베이스 연동 필요)
        let titles = ["국어 문제", "국어 문제", "영어 단어", "수학 복습", "수학 복습", "사회 복습", "물리 인강", "지구과학 복습"]
        let contents = ["비문학", "문학", "단어 100개", "미적분 복습", "기벡 복습", "개념 정리", "1, 2강", "오늘 수업 분량"]
        let subjects = ["국어", "국어", "영어", "수학", "수학", "사회", "물리", "지구과학"]
        let pageCounts = [10, 8, 15, 6, 20, 3, 5, 9] // 각 과목별 페이지 수
        let understandingLevels = [50, 60, 100, 80, 100, 10, 80, 60] // 각 과목별 이해도

        for (index, title) in titles.enumerated() {
            let subject = subjects[index]
            let colorIndex = subjects.firstIndex(of: subject)! % (CustomColor.colors.count - 1) // 색상 인덱스를 7개에서만 순환되도록 할당, 과목 순서에 맞게
                                                                                                // ! -> nil이 아님을 가정
            let diary = Diary(
                id: UUID(),
                date: Date(),
                title: title,
                content: contents[index],
                subject: subjects[index],
                pageCount: pageCounts[index],
                understandingLevel: understandingLevels[index],
                colorIndex: colorIndex
            )
            todayDiaries.append(diary)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
