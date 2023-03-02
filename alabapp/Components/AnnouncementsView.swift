//
//  AnnouncementsView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct AnnouncementsView: View {
    var body: some View {
        VStack (spacing: 20) {
            Text("Announcements")
                .fontWeight(.medium)
                .font(.title)
                .frame(width: 325, height: 35, alignment: .topLeading)
            
            Text("Sunday service on Sunday, June 14th will take place in Edison, NJ.\nContact us to confirm your attendance.")
                .padding([.leading, .trailing], 6)
                .font(.subheadline)
                .frame(maxWidth: 325, maxHeight: 80)
                .background(
                    Rectangle()
                        .fill(Color(red: 0.961, green: 0.961, blue: 0.961))
                        .cornerRadius(8)
                        .frame(width: 325, height: 80)
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2)
                )
        }
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView()
    }
}
