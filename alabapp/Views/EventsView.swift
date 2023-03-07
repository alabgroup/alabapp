//
//  EventsView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventsView: View {
    
    @EnvironmentObject var network: Network
    
    let screenW = CGFloat((UIScreen.main.bounds.width - 48.0))
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    Text("Events")
                        .fontWeight(.medium)
                        .font(MyFont.largeTitle)
                        .frame(width: screenW, height: 30, alignment: .center)
                    
                    Text("Happening Now")
                        .fontWeight(.medium)
                        .font(MyFont.title)
                        .frame(width: screenW, height: 35, alignment: .topLeading)
                    
                    EventCardView(eventTitle: network.events.first?.values.name ?? "", dateRange: network.events.first?.values.datesString ?? "", location: network.events.first?.values.location ?? "", image: "gospelforum")
                    
                }.padding(.bottom, 30)
                
                VStack (spacing: 30) {
                    Text("Upcoming")
                        .fontWeight(.medium)
                        .font(MyFont.title)
                        .frame(width: screenW, height: 24, alignment: .topLeading)
                    ForEach (network.events) { event in
                        EventCardView(eventTitle: event.values.name, dateRange: event.values.datesString, location: event.values.location, image: "hyc")
                    }
                }.padding(.bottom, 30)
            }.onAppear {
                network.getEvents()
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView().environmentObject(Network())
    }
}
