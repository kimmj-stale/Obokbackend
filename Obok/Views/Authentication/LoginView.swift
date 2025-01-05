//
//  LoginView.swift
//  Obok
//
//  Created by 김민경 on 12/28/24.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser
import GoogleSignIn

struct LoginView: View {
    var body: some View {
        VStack(spacing: 30) {
            // 회색 배경 및 이미지
            VStack {
                Image("loginpage")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.bottom, 10)
            .padding(.top, 50)

            // 카카오톡 버튼
            Button(action: {
                // 카카오톡 로그인 기능 추가
                print("카카오톡으로 시작하기 버튼 클릭")
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
            
            // 구글 버튼
            Button(action: {
                // 구글 로그인 기능 추가
                print("구글 계정으로 시작하기 버튼 클릭")
            }) {
                HStack {
                    Image("google")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("구글 계정으로 시작하기")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .cornerRadius(30)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.white)
        .alert(isPresented: $isKakaoLoginSuccessful) {
            Alert(title: Text("카카오 로그인"), message: Text("로그인이 성공적으로 완료되었습니다."), dismissButton: .default(Text("확인")))
        }
        .alert(isPresented: $isGoogleLoginSuccessful) {
            Alert(title: Text("구글 로그인"), message: Text("로그인이 성공적으로 완료되었습니다."), dismissButton: .default(Text("확인")))
        }
    }
    
    // 카카오 로그인
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
    
    // 구글 로그인
    func googleLogin() {
        guard let clientID = GIDSignIn.sharedInstance.clientID else {
            print("Google 클라이언트 ID가 설정되지 않았습니다.")
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: UIApplication.shared.windows.first!.rootViewController!) { user, error in
            
            if let error = error {
                print("구글 로그인 실패: \(error.localizedDescription)")
            } else {
                print("구글 로그인 성공: \(user?.profile?.email ?? "이메일 없음")")
                isGoogleLoginSuccessful = true
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
