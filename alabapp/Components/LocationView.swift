//
//  LocationView.swift
//  alabapp
//
//  Created by Janet Lee on 3/2/23.
//

import SwiftUI

struct LocationView: View {
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
                    network.getLocationContent()
                }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(Network())
    }
}
