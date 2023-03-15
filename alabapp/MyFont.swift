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
    static let mediumBlue = Color(hex: 0x1E5B85)
    static let lightBlue = Color(hex: 0x1E5B85)
    static let lightGray = Color(hex: 0xBDBDBD)
    static let lightestGray = Color(red: 0.961, green: 0.961, blue: 0.961)
    static let darkGray = Color(hex: 0x666666)
    static let yellow = Color(hex: 0xFFEBA4)
    
    static let gospelForum = EventMeta(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", isHappeningNow: 1, audience: "Open to all", codaName: "gospelForum23", posterUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl-GzgdR6wQjp/133b1e17e8d1b760724c6079d69a3a08163d19ce068334f8ce0b9ff839e848fb968c74cd5888137802703cab3b41cdc9f2357c8c0dc5722b481c8338a04c3b12b2a8d05ef70708dfd324963c10b347f2d0cb4358c5b32cc98cc66df1ab71595968ef0ee4", detailedViewBannerUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl--EJLBQhYZ3/6bf1018f29524ece9e915356f446b0195dabb0453b4327dbbcabfd6bdd656fee7a468387b683793e58e8063a77b0e6d0e3bf89e8b133b089d289a1e13c1d7833be1ef9399c9939d4028a9b4940bc63a5c3cde8d2b64e028c62df02640a20edc4683aa9f0", audiencePills: "Students,Public", venueMapUrl: "https://alabmobile.blob.core.windows.net/images/map_v1.jpg"))
}
