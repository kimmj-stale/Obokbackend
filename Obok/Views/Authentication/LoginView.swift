//
//  LoginView.swift
//  Obok
//
//  Created by 김민경 on 11/28/24.
//

import SwiftUI

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
                .background(Color.yellow)
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
