//
//  SubManagementView.swift
//  Obok
//
//  Created by 김민경 on 12/29/24.
//

import SwiftUI

struct SubManagementView: View {
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
                        .padding()
                }
                Text("과목 관리")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.leading)
                Spacer()
            }
            
            Text("과목을 숨기거나 다시 보이게 할 수 있어요.\n숨긴 과목은 메인과 모아보기에서 보이지 않아요.")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.leading, -5)
                        
            // 과목 보이기
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("과목 보이기")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Text("3개")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // 과목 리스트
                ForEach(["국어", "수학", "영어"], id: \.self) { subject in
                    HStack {
                        Circle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 10, height: 10)
                        
                        Text(subject)
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
            
            Divider()
                .padding(.horizontal)
            
            // 과목 숨기기
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("과목 숨기기")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Text("1개")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // 숨긴 과목 리스트
                HStack {
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 10, height: 10)
                    
                    Text("숨긴 과목")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding()

            Spacer()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct SubManagementView_Previews: PreviewProvider {
    static var previews: some View {
        SubManagementView()
    }
}
