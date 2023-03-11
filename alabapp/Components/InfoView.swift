//
//  InfoView.swift
//  alabapp
//
//  Created by Janet Lee on 3/1/23.
//

import SwiftUI

struct InfoView: View {
    let event: EventMeta
    @EnvironmentObject var network: Network
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                ForEach(network.information) { information in
                    VStack {
                        Text(information.values.title)
                            .font(MyFont.title3)
                    }.padding(.top, 20)
                    Text(information.values.message)
                        .font(MyFont.caption)
                }
            }.padding(.horizontal, 24)
                .onAppear {
                    network.getInfoContent(event: event)
                }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        
        let gospelForum = EventMeta(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", audience: "Open to all", codaName: "gospelForum23", imageUrl: "gospelforum"))
        
        InfoView(event: gospelForum).environmentObject(Network())
    }
}
