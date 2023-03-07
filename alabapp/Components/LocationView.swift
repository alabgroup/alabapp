//
//  LocationView.swift
//  alabapp
//
//  Created by Janet Lee on 3/2/23.
//

import SwiftUI

struct LocationView: View {
    let event: Event
    @EnvironmentObject var network: Network
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                ForEach(network.locationInfo) { locationInfo in
                    HStack {
                        Image(systemName: locationInfo.values.icon)
                        Text(locationInfo.values.title)
                            .font(MyFont.title3)
                    }.padding(.top, 20)
                    Text(locationInfo.values.message)
                        .font(MyFont.caption)
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
        
        let gospelForum = Event(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", audience: "Open to all", codaName: "gospelForum23"))
        
        LocationView(event: gospelForum).environmentObject(Network())
    }
}
