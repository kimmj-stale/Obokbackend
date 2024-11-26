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
                        .fontWeight(.bold)
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                        .padding(.leading, 10)

                    List(todayDiaries) { diary in
                        NavigationLink(destination: DiaryDetailView(diary: diary)) {
                            DiaryRowView(diary: diary) // 일기 정보
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
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
        // 샘플 데이터 로드 (추후 데이터베이스 연동 필요)
        todayDiaries = [
            Diary(id: UUID(), date: Date(), title: "수학 복습", content: "미적분 복습", subject: "수학", understandingLevel: 8, distractions: [], improvements: []),
            Diary(id: UUID(), date: Date(), title: "수학 복습", content: "미적분 복습", subject: "수학", understandingLevel: 8, distractions: [], improvements: []),
            Diary(id: UUID(), date: Date(), title: "수학 복습", content: "미적분 복습", subject: "수학", understandingLevel: 8, distractions: [], improvements: []),
        ]
    }
}
