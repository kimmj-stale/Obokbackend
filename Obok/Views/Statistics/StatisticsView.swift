//
//  StatisticsView.swift
//  Obok
//
//  Created by 김민경 on 01/01/25.
//

import SwiftUI

struct StatisticsView: View {
    @Environment(\.presentationMode) var presentationMode
   
    
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

                    Text("통계")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                }
                .padding([.top, .horizontal], 24)
            }
        }
        .navigationBarHidden(true)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
