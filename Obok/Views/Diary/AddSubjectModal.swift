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

            // 과목 입력 텍스트 필드
            TextField("과목명", text: $subjectName)
                .font(.system(size: 16))
                .padding(.horizontal, 16)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: subjectName) { newValue in // 8글자 제한
                    if newValue.count > 8 {
                        subjectName = String(newValue.prefix(8))
                    }
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
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
        }
    }
}

struct AddSubjectModal_Previews: PreviewProvider {
    static var previews: some View {
        AddSubjectModal(isShowingModal: .constant(true))
    }
}
