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
                        Text("오복과 함께한 n월")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    
                    // n번의 기록
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
                    .padding(.horizontal, 24)

                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 4)
                        .padding(.top, -40)
                    
                    // 과목 개수 순위
                    HStack{
                        Image("mostStudy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170)
                        VStack{
                            VStack{
                                Text("가장 자주 공부한 과목")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.bottom, -10)
                                
                                HStack{
                                    Text("국어")
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Text("# n회")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.top, 20)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    .padding(.top, -20)
                    
                    // 아쉬운 점에 대한 원인
                    Text("공부 방해 요인")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 24)
                    
                    HStack{
                        Text("#키워드")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .padding(.leading, 24)
                            .padding(.top, -3)
                        
                        Text("가 가장 많았어요")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, -3)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 4)
                        .padding(.top, 5)
                    
                    VStack{
                        Text("이번 달에 이해가 잘 된 과목이예요")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 24)
                            .padding(.top, 10)
                        HStack{
                            HStack{
                                Image("1st")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding(.leading, -24)
                                VStack{
                                    Text("n%")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.top, -3)
                                    
                                    Text("국어")
                                        .font(.system(size: 30))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.top, -3)
                                }
                            }
                            
                            HStack{
                                Image("2nd")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                VStack{
                                    Text("n%")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.top, -3)

                                    Text("국어")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.top, -3)
                                }
                            }
                            
                            HStack{
                                Image("3rd")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                VStack{
                                    Text("n%")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.top, -3)

                                    Text("국어")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.top, -3)
                                }
                            }
                        }
                        
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 4)
                            .padding(.top, 5)
                    }
                        
                }
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
