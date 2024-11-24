//
//  UserViewModel.swift
//  Obok
//
//  Created by 김민경 on 11/24/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var isLoggedIn: Bool = false
}
