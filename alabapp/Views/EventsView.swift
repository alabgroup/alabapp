//
//  EventsView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        ScrollView {
            VStack (spacing: 60) {
                Text("Happening Now")
                    .fontWeight(.medium)
                    .font(.title)
                    .frame(width: 325, height: 35, alignment: .topLeading)
                
                EventCardView()
                
            }.padding(.bottom, 50)
            
            VStack (spacing: 60) {
                Text("Upcoming")
                    .fontWeight(.medium)
                    .font(.title)
                    .frame(width: 325, height: 35, alignment: .topLeading)
                EventCardView()
                EventCardView()
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
