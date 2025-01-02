//
//  StatisticsView.swift
//  Obok
//
//  Created by 김민경 on 01/01/25.
//

import SwiftUI

struct StatisticsView: View {
    @Environment(\.presentationMode) var presentationMode
   
    // 현재 연도 가져오기
    private var currentYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년"
        return dateFormatter.string(from: Date())
    }
    
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
                    
                    Image("calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text(currentYear)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
                .padding([.top, .horizontal], 24)
                
                Divider()
                
                ScrollView {
                    HStack{
                        // n번의 기록
                        Text("오복과 함께한 n월")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(height: 70)
                            .offset(y: 23) // 이미지 아래로 배치
                        
                        Image("writeNum")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 200)
                            .offset(y: -31)
                        
                        Text("n번의 기록에서")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(y: 22)
                    }
                }
                .padding(.horizontal, 24)
            }
            
            Spacer()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
