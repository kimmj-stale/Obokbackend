//
//  LoginView.swift
//  Obok
//
//  Created by 김민경 on 12/28/24.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

struct LoginView: View {
    @State private var isKakaoLoginSuccessful = false

    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Image("loginpage")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.bottom, 10)
            .padding(.top, 50)
            
            Button(action: {
                kakaoLogin()
            }) {
                HStack {
                    Image("kakao")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("카카오톡으로 시작하기")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: "F9DB00"))
                .cornerRadius(30)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.white)
        .alert(isPresented: $isKakaoLoginSuccessful) {
            Alert(
                title: Text("카카오 로그인"),
                message: Text("로그인이 성공적으로 완료되었습니다."),
                dismissButton: .default(Text("확인"))
            )
        }
    }

    func kakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print("카카오톡 로그인 실패: \(error.localizedDescription)")
                } else {
                    print("카카오톡 로그인 성공: \(oauthToken?.accessToken ?? "")")
                    isKakaoLoginSuccessful = true
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    print("카카오 계정 로그인 실패: \(error.localizedDescription)")
                } else {
                    print("카카오 계정 로그인 성공: \(oauthToken?.accessToken ?? "")")
                    isKakaoLoginSuccessful = true
                }
            }
        }
    }
}

// Color 확장 함수
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
