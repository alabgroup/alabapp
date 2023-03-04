//
//  EventsView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventsView: View {
    let screenW = CGFloat((UIScreen.main.bounds.width - 48.0))

    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    Text("Events")
                        .fontWeight(.medium)
                        .font(.largeTitle)
                        .frame(width: screenW, height: 30, alignment: .center)
                    
                    Text("Happening Now")
                        .fontWeight(.medium)
                        .font(.title)
                        .frame(width: screenW, height: 35, alignment: .topLeading)
                    
                    EventCardView()
                    
                }.padding(.bottom, 30)
                
                VStack (spacing: 30) {
                    Text("Upcoming")
                        .fontWeight(.medium)
                        .font(.title)
                        .frame(width: screenW, height: 24, alignment: .topLeading)
                    EventCardView()
                    EventCardView()
                }.padding(.bottom, 30)
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
