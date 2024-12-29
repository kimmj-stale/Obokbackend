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
        }
        .padding()
        .background(Color.white)
    }
}


struct SubManagementView_Previews: PreviewProvider {
    static var previews: some View {
        SubManagementView()
    }
}
