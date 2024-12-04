//
//  AddSubjectModal.swift
//  Obok
//
//  Created by 김민경 on 12/3/24.
//

import SwiftUI

struct AddSubjectModal: View {
    @Binding var isShowingModal: Bool
    @State private var subjectName: String = ""
    @State private var currentWord = 0
    private let totalWord = 8

    var body: some View {
        VStack {
            // 모달 상단 제목
            HStack {
                Text("과목 추가하기")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.top, 20)

                Spacer()

                Button(action: {
                    isShowingModal = false
                }) {
                    Image("xbutton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.horizontal, 20)

            Spacer().frame(height: 20)

            // 과목명     n / 8
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    TextField("과목명", text: $subjectName)
                        .font(.system(size: 16))
                        .onChange(of: subjectName) { newValue in
                            // 8글자 제한
                            if newValue.count > totalWord {
                                subjectName = String(newValue.prefix(totalWord))
                            }
                            // 현재 입력된 글자 수 업데이트
                            currentWord = subjectName.count
                        }
                    
                    Spacer()

                    Text("\(currentWord) / \(totalWord)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.trailing, 4)
                }
                .padding(.horizontal, 20)
                
                // 밑줄
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 18)
            }

            Spacer().frame(height: 26)

            // 과목 추가하기 버튼
            Button(action: {
                // 과목 추가하기 누른 후에는 추후 구현
                isShowingModal = false
            }) {
                Text("과목 추가하기")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.15))
            }
            .padding(.bottom, -20) // 버튼을 모달 하단 끝에
        }
    }
}

struct AddSubjectModal_Previews: PreviewProvider {
    static var previews: some View {
        AddSubjectModal(isShowingModal: .constant(true))
    }
}
