//
//  SubManagementView.swift
//  Obok
//
//  Created by 김민경 on 12/29/24.
//

import SwiftUI

struct SubManagementView: View {
    var body: some View {
        VStack {
            Text("과목 관리")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("과목 관리") // 네비게이션 타이틀 설정
        .navigationBarTitleDisplayMode(.inline) // 타이틀 인라인 표시
    }
}

struct SubManagementView_Previews: PreviewProvider {
    static var previews: some View {
        SubManagementView()
    }
}
