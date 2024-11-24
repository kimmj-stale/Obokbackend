//
//  SignUpView.swift
//  Obok
//
//  Created by 김민경 on 11/23/24.
//

// 회원가입 화면 - 카카오, 네이버, 구글 간편 회원가입 지원

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("회원가입")
                .font(.largeTitle)
                .bold()

            // 간편 회원가입 버튼들
            Button("카카오") {
                // 추후 구현
            }
            .buttonStyle(.borderedProminent)

            Button("네이버") {
                // 추후 구현
            }
            .buttonStyle(.borderedProminent)

            Button("구글") {
                // 추후 구현
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
