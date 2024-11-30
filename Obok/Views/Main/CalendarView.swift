//
//  CalendarView.swift
//  Obok
//
//  Created by 김민경 on 11/24/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date // • 선택된 날짜 바인딩
    @State private var weekDates: [Date] = [] // 현재 주차 날짜들
    @State private var studyData: [Date: [Color]] = [:] // 날짜별 과목 색상

    var body: some View {
        VStack(spacing: 16) {
            // 상단 설정, 통계, 모아보기 버튼
            HStack {
                Button(action: {
                    print("설정 버튼 클릭")
                }) {
                    Image("setting")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }

                Spacer()

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
            .padding(.horizontal, 26)
            .frame(height: 40)

            // 명언 영역
            VStack(spacing: 8) {
                Text("오늘은 월요일..........\n월요일......................")
                    .font(.system(size: 16))
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            // 중앙 이전 주/다음 주 버튼과 월 표시
            HStack {
                Text(currentMonthYear)
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 2) {
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
                    }
                }
            }
            .padding(.horizontal, 26)

            // 주차별 달력 구성
            HStack(spacing: 8) {
                ForEach(weekDates, id: \.self) { date in
                    VStack(spacing: 8) {
                        ZStack {
                            if isToday(date) {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.black)
                                    .frame(width: 26, height: 18)
                            }

                            Text(dayOfWeek(for: date))
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(isToday(date) ? .white : colorForWeekday(date))
                        }

                        ZStack {
                            // 날짜 배경 둥근 사각형
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.clear)
                                .frame(width: 30, height: 30)
                                .overlay(
                                    GeometryReader { geometry in
                                        VStack(spacing: 0) {
                                            if let subjects = studyData[date], !subjects.isEmpty {
                                                ForEach(0..<min(subjects.count, 3), id: \.self) { index in
                                                    RoundedRectangle(cornerRadius: 0)
                                                        .fill(subjects[index])
                                                        .frame(height: geometry.size.height / CGFloat(subjects.count))
                                                }
                                            } else {
                                                RoundedRectangle(cornerRadius: 6)
                                                    .fill(Color.gray.opacity(0.1))
                                                    .frame(height: geometry.size.height)
                                            }
                                        }
                                    }
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 6))

                            // 날짜 숫자
                            Text("\(day(for: date))")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(width: 45, height: 45)
                        }
                        .onTapGesture {
                            selectedDate = date
                        }
                    }
                }
            }
        }
        .onAppear {
            loadWeekDates()
            loadStudyData() // 초기 데이터 로드
        }
        .background(Color.white)
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

    // 주 변경
    private func changeWeek(by offset: Int) {
        let calendar = Calendar.current
        if let newDate = calendar.date(byAdding: .weekOfYear, value: offset, to: selectedDate) {
            selectedDate = newDate
            loadWeekDates()
            loadStudyData() // 주 변경 시 데이터 로드
        }
    }

    // 월/연도 문자열 포맷 (한국어 형식)
    private var currentMonthYear: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "LLLL"
        return formatter.string(from: selectedDate)
    }

    // 요일 문자열 (월~일)
    private func dayOfWeek(for date: Date) -> String {
        let weekdaySymbols = ["월", "화", "수", "목", "금", "토", "일"]
        let calendar = Calendar.current
        let weekdayIndex = calendar.component(.weekday, from: date) - 2
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

    // 데이터 로드 (샘플 데이터, 추후에는 불러오는걸로 수정)
    private func loadStudyData() {
        // 샘플 데이터를 추가하여 studyData 업데이트
        for (index, date) in weekDates.enumerated() {
            let subjectColors = (0..<min(index + 1, 3)).map { i in
                CustomColor.colors[i % CustomColor.colors.count]
            }
            studyData[date] = subjectColors
        }
    }
}
