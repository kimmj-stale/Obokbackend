//
//  SettingsView.swift
//  Obok
//
//  Created by 김민경 on 11/28/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isNotificationOn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
                }) {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Text("설정")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.leading)
                Spacer()
            }
            
            // 알림 섹션
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("alarm")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text("알림")
                        .font(.system(size: 15))
                    Spacer()
                    Toggle("", isOn: $isNotificationOn)
                        .labelsHidden()
                        .tint(Color(hex2: "FA6F6F"))
                }
                Text("매일 저녁 21시, 23시에 상담바 알림을 받아요")
                    .font(.system(size: 12))
                    .foregroundColor(.red)
                    .padding(.leading, 30)
            }
            .padding()
            
            // 과목 관리 섹션
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("setting")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text("과목 관리")
                        .font(.system(size: 15))
                    Spacer()
                    
                    NavigationLink(destination: SubManagementView()) {
                        Image("go")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                }
                Text("• 국어, 영어, 수학, 역사, 과학, 기술가정, 정보, 자격증")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 30)
                Text("• 숨긴 과목 1개")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 30)
            }
            .padding()
            
            // 로그인 정보
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text("로그인 정보")
                        .font(.headline)
                    Spacer()

                    Button(action: {
                        print("회원탈퇴 버튼 클릭")
                    }) {
                        Text("회원탈퇴")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image("google")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack{
                            Text("email@google.com")
                                .font(.system(size: 12))
                                .foregroundColor(.red)

                            Spacer()
                            
                            Button(action: {
                                print("로그아웃 버튼 클릭")
                            }) {
                                Text("로그아웃")
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .fill(Color.gray.opacity(0.05))
                        .background(Color(hex2: "FBFBFB"))
                )
                Spacer()

                // 공지사항
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image("notice")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("공지사항")
                            .font(.system(size: 15))
                        Spacer()
                    }
                }
                
                // 고객센터
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image("info")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("고객센터/운영정책")
                            .font(.system(size: 15))
                        Spacer()
                    }
                }
                
                // 튜토리얼
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image("info")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("튜토리얼 다시보기")
                            .font(.system(size: 15))
                        Spacer()
                    }
                }
                Spacer()

            }
            .padding()
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .navigationBarHidden(true)
    }
}

// Color 확장 함수
extension Color {
    init(hex2: String) {
        let scanner = Scanner(string: hex2)
        scanner.currentIndex = hex2.startIndex
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
