//
//  AnnouncementsView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct AnnouncementsView: View {
    var body: some View {
        VStack {
            Text("Announcements")
                .fontWeight(.medium)
                .font(.title)
                .frame(width: 325, height: 35, alignment: .topLeading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 325, height:80)
                    .foregroundColor(Color.white)
                Text("Sunday service on Sunday, June 14th will take place in Edison, NJ.\nContact us to confirm your attendance.")
                    .padding(6)
                    .font(.caption)
                    .frame(maxWidth: 325, maxHeight: 80)
            }.shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
        }
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView()
    }
}
