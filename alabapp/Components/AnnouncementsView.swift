//
//  AnnouncementsView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct AnnouncementsView: View {
    @EnvironmentObject var network: Network
    let screenW = CGFloat((UIScreen.main.bounds.width - 48.0))

    var announcements: [AnnouncementMeta]
    
    var body: some View {
        VStack (spacing: 10) {
            if !announcements.isEmpty {
                Text("Announcements")
                    .fontWeight(.medium)
                    .font(MyFont.title)
                    .foregroundColor(MyFont.black)
                    .frame(width: screenW, alignment: .topLeading)
                
                ForEach(announcements) { announcementInfo in
                    Text(announcementInfo.values.message)
                        .padding(.horizontal, 6)
                        .font(MyFont.caption)
                        .foregroundColor(MyFont.black)
                        .frame(maxWidth: screenW, maxHeight: 70)
                        .background(
                            Rectangle()
                                .fill(MyFont.lightestGray)
                                .cornerRadius(8)
                                .frame(width: screenW, height: 70)
                                .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2)
                        )
                }
            }
        }
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView(announcements: [AnnouncementMeta(id: "0", index: 0, values: AnnouncementContent(message:"This is a primary announcement lalala.",expiration:"2023-02-15T00:00:00.000-04:00")), AnnouncementMeta(id: "1", index: 1, values: AnnouncementContent(message:"This is a secondary announcement.",expiration:"2023-06-15T00:00:00.000-04:00")),])
    }
}
