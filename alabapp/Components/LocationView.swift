//
//  LocationView.swift
//  alabapp
//
//  Created by Janet Lee on 3/2/23.
//

import SwiftUI

struct LocationView: View {
    let event: EventMeta
    @EnvironmentObject var network: Network
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                ForEach(network.locationInfo) { locationInfo in
                    HStack {
//                        Image(systemName: locationInfo.values.icon)
                        Text(locationInfo.values.title)
                            .font(MyFont.headline)
                        if locationInfo.values.title == "Venue Information" {
                            NavigationLink(destination: VenueMapView(eventVenueMap: event.values.venueMapUrl)) {
                                Image(systemName: "map")
                                .frame(width: 30, height: 30)
                                .foregroundColor(MyFont.white)
                                .background(MyFont.darkBlue)
                                .clipShape(Circle())
                            }
                        }
                    }.padding(.top, 10)
                    Text(locationInfo.values.message)
                        .font(MyFont.caption)
                    Divider()
                }
            }.padding(.horizontal, 24)
                .onAppear {
                    network.getLocationContent(event: event)
                }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(event: MyFont.gospelForum).environmentObject(Network())
    }
}
