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
            Text("과목 추가하기")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.top, 20)

            Spacer().frame(height: 30)
-
        }
    }
}

struct AddSubjectModal_Previews: PreviewProvider {
    static var previews: some View {
        AddSubjectModal(isShowingModal: .constant(true))
    }
}
