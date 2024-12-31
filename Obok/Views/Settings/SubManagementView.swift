//
//  SubManagementView.swift
//  Obok
//
//  Created by 김민경 on 12/29/24.
//

import SwiftUI

struct SubManagementView: View {
    @Environment(\.presentationMode) var presentationMode

    // 과목 선택 상태 관리
    @State private var visibleSubjects: [String: Bool] = [
        "국어": false,
        "수학": false,
        "영어": false
    ]
    @State private var hiddenSubjects: [String: Bool] = [
        "숨긴 과목": false
    ]
    
    @State private var isEditing: Bool = false // 편집 활성화 상태

    var body: some View {
        VStack(spacing: 20) {
            // 상단 헤더
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
            
            // 설명 텍스트
            Text("과목을 숨기거나 다시 보이게 할 수 있어요.\n숨긴 과목은 메인과 모아보기에서 보이지 않아요.")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.leading, -10)

            // 과목 보이기 섹션
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("과목 보이기")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(visibleSubjects.filter { $0.value }.count)개")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // 과목 리스트
                ForEach(visibleSubjects.keys.sorted(), id: \.self) { subject in
                    HStack {
                        if isEditing {
                            Checkbox(isChecked: Binding(
                                get: { visibleSubjects[subject, default: false] },
                                set: { visibleSubjects[subject] = $0 }
                            ))
                        }
                        
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
            
            // 과목 숨기기 섹션
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("과목 숨기기")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(hiddenSubjects.filter { $0.value }.count)개")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // 숨긴 과목 리스트
                ForEach(hiddenSubjects.keys.sorted(), id: \.self) { subject in
                    HStack {
                        if isEditing {
                            Checkbox(isChecked: Binding(
                                get: { hiddenSubjects[subject, default: false] },
                                set: { hiddenSubjects[subject] = $0 }
                            ))
                        }
                        
                        Text(subject)
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
            
            Spacer()
            
            // 변경하기 버튼
            VStack(spacing: 10) {
                if isEditing {
                    Button(action: {
                        print("숨기기 버튼 클릭")
                    }) {
                        Text("숨기기")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding(.horizontal, 25)
                    }
                    
                    Button(action: {
                        print("보이기 버튼 클릭")
                    }) {
                        Text("보이기")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding(.horizontal, 25)
                    }
                }
                
                Button(action: {
                    isEditing.toggle() // 편집 모드 전환
                }) {
                    Text(isEditing ? "완료" : "변경하기")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(isEditing ? .black : .white)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(isEditing ? Color.white : Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isEditing ? Color.black : Color.clear, lineWidth: 1)
                        )
                        .cornerRadius(10)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 20)
                }
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

// Checkbox
struct Checkbox: View {
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Circle()
                .strokeBorder(Color.gray, lineWidth: 2)
                .background(isChecked ? Circle().fill(Color.gray) : nil)
                .frame(width: 18, height: 18)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SubManagementView_Previews: PreviewProvider {
    static var previews: some View {
        SubManagementView()
    }
}
