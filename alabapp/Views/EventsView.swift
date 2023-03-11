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
                    
                    EventCardView(event: network.events.first ?? EventMeta(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", isHappeningNow: 1, audience: "Open to all", codaName: "gospelForum23", posterUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl-GzgdR6wQjp/133b1e17e8d1b760724c6079d69a3a08163d19ce068334f8ce0b9ff839e848fb968c74cd5888137802703cab3b41cdc9f2357c8c0dc5722b481c8338a04c3b12b2a8d05ef70708dfd324963c10b347f2d0cb4358c5b32cc98cc66df1ab71595968ef0ee4", detailedViewBannerUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl--EJLBQhYZ3/6bf1018f29524ece9e915356f446b0195dabb0453b4327dbbcabfd6bdd656fee7a468387b683793e58e8063a77b0e6d0e3bf89e8b133b089d289a1e13c1d7833be1ef9399c9939d4028a9b4940bc63a5c3cde8d2b64e028c62df02640a20edc4683aa9f0"))).offset(y: 70)
                    
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
