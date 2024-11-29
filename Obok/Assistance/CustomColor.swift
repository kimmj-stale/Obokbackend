//
//  CustomColor.swift
//  Obok
//
//  Created by 김민경 on 11/27/24.
//

import SwiftUI

struct CustomColor {
    // Hex 값만을 나열한 배열
    private static let hexValues: [String] = [
        "#FF7070", "#FFA32A", "#B6E746", "#50DC86", "#83DCFF", "#4875F2", "#B383FF"
    ]

    // Hex -> Color 변환
    static let colors: [Color] = hexValues.map { fromHex($0) }

    // Hex -> Color 변환 함수
    static func fromHex(_ hex: String) -> Color {
        let hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        return Color(red: red, green: green, blue: blue)
    }
}
