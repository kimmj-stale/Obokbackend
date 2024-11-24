//
//  DiaryViewModel.swift
//  Obok
//
//  Created by 김민경 on 11/24/24.
//

import Foundation

class DiaryViewModel: ObservableObject {
    @Published var diaries: [String] = [] // 일기 데이터
}
