//
//  DiaryEditView.swift
//  Obok
//
//  Created by 김민경 on 12/27/24.
//

import SwiftUI

struct DiaryEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var subjects: [String] = []
    @State private var isShowingModal = false
    @State private var pageText: String = ""
    @State private var isShowingAlert = false

    let maxSubjects = 15

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                // 상단 네비게이션 영역
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
                    }) {
                        Image("backbutton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }

                    Spacer()

                    Text("학습일기 수정하기")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                }
                .padding([.top, .horizontal], 24)
                
                // 회색 구분 줄
                Divider()
                    .background(Color.gray.opacity(0.5))
                    .padding(.bottom, 50)

                // DiaryCreate step 1
                // DiaryCreate step 2
                // DiaryCreate step 3
                // DiaryCreate step 4
                // DiaryCreate step 5

                // 다음으로 버튼
                NavigationLink(destination: DiaryCreateView2()) {
                    Text("다음으로")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 20)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct DiaryEditView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryEditView()
    }
}
