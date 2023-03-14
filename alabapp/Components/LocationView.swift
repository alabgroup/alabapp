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
        
        let gospelForum = EventMeta(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", isHappeningNow: 1, audience: "Open to all", codaName: "gospelForum23", posterUrl: "gospelforum", detailedViewBannerUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl--EJLBQhYZ3/6bf1018f29524ece9e915356f446b0195dabb0453b4327dbbcabfd6bdd656fee7a468387b683793e58e8063a77b0e6d0e3bf89e8b133b089d289a1e13c1d7833be1ef9399c9939d4028a9b4940bc63a5c3cde8d2b64e028c62df02640a20edc4683aa9f0", audiencePills: "Students,Public"))
        
        LocationView(event: gospelForum).environmentObject(Network())
    }
}
