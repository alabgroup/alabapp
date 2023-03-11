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

    var body: some View {
        VStack (spacing: 10) {
            if !network.announcements.isEmpty {
                Text("Announcements")
                    .fontWeight(.medium)
                    .font(MyFont.title)
                    .foregroundColor(MyFont.black)
                    .frame(width: screenW, alignment: .topLeading)
                
                ForEach(network.announcements) { announcementInfo in
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
        }.onAppear {
            network.getAnnouncements()
        }
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView().environmentObject(Network())
    }
}
