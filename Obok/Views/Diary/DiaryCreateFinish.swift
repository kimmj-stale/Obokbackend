//
//  DiaryCreateDone.swift
//  Obok
//
//  Created by 김민경 on 12/27/24.
//

import SwiftUI

struct DiaryCreateFinish: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                // 상단 네비게이션 영역
                HStack {
                    Text("학습일기 작성하기")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.top, .horizontal], 24)

                // DiaryCreateFinish 이미지와 텍스트
                VStack {
                    Image("DiaryCreateFinish")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity) // 이미지의 최대 너비를 화면에 맞춤
                        .padding(.horizontal, 25)
                        .padding(.vertical, 150) // 위아래 여백 추가

                    Text("오늘도 고생했어요!")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .padding(.top, -100) // 이미지와 텍스트 사이 여백
                }
                .padding([.horizontal], 24)

                Spacer()

                // 완료 버튼
                NavigationLink(destination: MainView()) {
                    Text("완료")
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

struct DiaryCreateFinish_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateFinish()
    }
}
