//
//  MyFont.swift
//  alabapp
//
//  Created by Joane Joseph on 3/1/23.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
struct MyFont {
    
    // Fonts
    static let largeTitle = Font.custom("RalewayRoman-Bold", size: 36.0)
    static let title = Font.custom("RalewayRoman-Medium", size: 24.0)
    static let title2 = Font.custom("RalewayRoman-SemiBold", size: 30.0)
    static let title3 = Font.custom("RalewayRoman-Medium", size: 23.3)
    static let headline = Font.custom("RalewayRoman-SemiBold", size: 16.0)
    static let subheadline = Font.custom("RalewayRoman-Regular", size: 16.0)
    static let body = Font.custom("RalewayRoman-Semibold", size: 14.0)
    static let callout = Font.custom("RalewayRoman-Regular", size: 14.0)
    static let caption = Font.custom("RalewayRoman-Regular", size: 12.0)
    static let caption2 = Font.custom("RalewayRoman-Medium", size: 12.0)
    static let footnote = Font.custom("RalewayRoman-SemiBold", size: 8.0)
    
    // Colors
    static let white = Color(hex: 0xFFFFFF)
    static let black = Color(hex: 0x000000)
    static let darkBlue = Color(hex: 0x052D68)
    static let lightBlue = Color(hex: 0x1E5B85)
    static let lightGray = Color(hex: 0xBDBDBD)
    static let darkGray = Color(hex: 0x666666)
}
