//
//  EventsView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    Text("Events")
                        .fontWeight(.medium)
                        .font(.largeTitle)
                        .frame(width: 325, height: 30, alignment: .center)
                    
                    Text("Happening Now")
                        .fontWeight(.medium)
                        .font(.title)
                        .frame(width: 325, height: 35, alignment: .topLeading)
                        .padding(.bottom, 40)
                    
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
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
