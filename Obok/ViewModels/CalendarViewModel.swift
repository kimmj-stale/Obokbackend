//
//  CalendarView.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date // 선택된 날짜 바인딩
    @State private var weekDates: [Date] = [] // 현재 주차 날짜들
    @State private var studyData: [Date: [Color]] = [:] // 날짜별 과목 색상

    var body: some View {
        VStack(spacing: 16) {
            
            // 상단 설정, 통계, 모아보기 버튼
            HStack {
                // 설정 버튼 (왼쪽 정렬)
                Button(action: {
                    print("설정 버튼 클릭")
                }) {
                    Image("setting")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }

                Spacer()

                // 통계 및 모아보기 버튼 (오른쪽 정렬)
                HStack(spacing: 16) {
                    Button(action: {
                        print("통계 버튼 클릭")
                    }) {
                        Image("statistics")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 24)
                    }

                    Button(action: {
                        print("모아보기 버튼 클릭")
                    }) {
                        Image("collection")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 24)
                    }
                }
            }
            .padding(.horizontal, 26) // 좌우 여백 설정
            .frame(height: 40) // HStack 높이 고정

            // 상단 공부 명언 표시
            VStack(spacing: 8) {
                Text("오늘은 월요일..........\n월요일......................") // 명언 예시
                    .font(.system(size: 16))
                    .padding(.horizontal, 18)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            // 중앙 이전 주/다음 주 버튼과 월 표시
            HStack {
                Text(currentMonthYear)
                    .font(.system(size: 16, weight:.bold))
                    .frame(maxWidth: .infinity, alignment: .leading) // 좌측 정렬

                HStack(spacing: 2) { // 화살표 버튼 우측 정렬
                    Button(action: {
                        changeWeek(by: -1)
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding()
                    }

                    Button(action: {
                        changeWeek(by: 1)
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding()
                    }
                }
            }
            .padding(.horizontal, 26) // 좌우 여백 설정

            // 주차별 달력 구성
            HStack(spacing: 8) {
                ForEach(weekDates, id: \.self) { date in
                    VStack(spacing: 8) {
                        ZStack {
                            if isToday(date) {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.black)
                                    .frame(width: 30, height: 18)
                            }

                            Text(dayOfWeek(for: date)) // 월~일 표시
                                .font(.system(size: 12, weight:.bold))
                                .foregroundColor(isToday(date) ? .white : colorForWeekday(date))
                        }

                        ZStack {
                            Circle()
                                .stroke(selectedDate == date ? Color.blue : Color.clear, lineWidth: 2)
                                .frame(width: 45, height: 15)

                            VStack(spacing: 2) {
                                ForEach(studyData[date] ?? [], id: \.self) { color in
                                    Circle()
                                        .fill(color)
                                        .frame(width: 10, height: 10)
                                }
                            }
                        }
                        .onTapGesture {
                            selectedDate = date
                        }

                        Text("\(day(for: date))") // 날짜 숫자
                            .font(.headline)
                            .foregroundColor(colorForWeekday(date)) // 숫자는 요일 색상
                    }
                }
            }
            Spacer()
        }
        .onAppear {
            loadWeekDates()
            loadStudyData()
        }
    }

    // 오늘 날짜인지 확인
    private func isToday(_ date: Date) -> Bool {
        Calendar.current.isDateInToday(date)
    }

    // 현재 주차 날짜 로드 (월요일부터 시작)
    private func loadWeekDates() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: selectedDate)

        // 월요일로 설정 (한 주의 시작은 월요일)
        guard let monday = calendar.date(from: components) else { return }

        // 월요일부터 7일간의 날짜 배열 생성
        weekDates = (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: monday)
        }
    }

    // 공부 데이터 로드 (더미 데이터)
    private func loadStudyData() {
        let calendar = Calendar.current
        studyData = [
            calendar.date(byAdding: .day, value: 0, to: selectedDate)!: [.red, .blue, .orange],
            calendar.date(byAdding: .day, value: 1, to: selectedDate)!: [.green],
            calendar.date(byAdding: .day, value: 2, to: selectedDate)!: [.purple, .pink],
            calendar.date(byAdding: .day, value: 3, to: selectedDate)!: []
        ]
    }

    // 주 변경
    private func changeWeek(by offset: Int) {
        let calendar = Calendar.current
        if let newDate = calendar.date(byAdding: .weekOfYear, value: offset, to: selectedDate) {
            selectedDate = newDate
            loadWeekDates()
        }
    }

    // 월/연도 문자열 포맷 (한국어 형식)
    private var currentMonthYear: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "LLLL" // 월만 표시
        return formatter.string(from: selectedDate)
    }

    // 요일 문자열 (월~일)
    private func dayOfWeek(for date: Date) -> String {
        let weekdaySymbols = ["월", "화", "수", "목", "금", "토", "일"]
        let calendar = Calendar.current
        let weekdayIndex = calendar.component(.weekday, from: date) - 2 // 월요일 시작
        return weekdaySymbols[(weekdayIndex + 7) % 7]
    }

    // 날짜 숫자
    private func day(for date: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }

    // 요일별 색상 설정
    private func colorForWeekday(_ date: Date) -> Color {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)

        if weekday == 7 { // 토요일
            return .blue
        } else if weekday == 1 { // 일요일
            return .red
        } else {
            return .primary
        }
    }
}
