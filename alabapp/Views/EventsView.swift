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
            ScrollView (showsIndicators: false) {
                VStack (spacing: 20) {
                    Text("Events")
                        .fontWeight(.medium)
                        .font(MyFont.largeTitle)
                        .frame(width: screenW, height: 30, alignment: .center)
                    
                    Text("Happening Now")
                        .fontWeight(.medium)
                        .font(MyFont.title)
                        .frame(width: screenW, height: 35, alignment: .topLeading)
                    
                    if network.events.filter {$0.values.isHappeningNow == 1}.isEmpty {
                        Text("There are no events happening now.")
                    } else {
                        ForEach (network.events.filter {$0.values.isHappeningNow == 1}) { event in
                            EventCardView(event: event)
                                .fixedSize()
                        }.offset(y: 70)}
                    
                }
                
                VStack (spacing: 30) {
                    Text("Upcoming")
                        .fontWeight(.medium)
                        .font(MyFont.title)
                        .frame(width: screenW, height: 24, alignment: .topLeading)
                    ForEach (network.events.filter {$0.values.isHappeningNow == 0}) { event in
                        EventCardView(event: event)
                            .fixedSize()
                    }.offset(y: 80)
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
