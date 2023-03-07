//
//  EventCardView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventCardView : View {
    var eventTitle: String
    var dateRange: String
    var location: String
    var image: String

    var body: some View {
        // Event card
        NavigationLink(destination: EventDetailedView()) {
            ZStack (alignment: .topLeading) {
                
                // Event title and info
                VStack(alignment: .leading, spacing: 10) {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: (UIScreen.main.bounds.width - 48), height: 200)
                        .padding([.horizontal], 24)
                    
                    Text(eventTitle)
                        .font(MyFont.title3)
                        .foregroundColor(Color.black)
                        .padding(.leading, 40)
                    
                    HStack (spacing: 10) {
                        Image(systemName:"calendar")
                            .foregroundColor(Color.black)
                        Text(dateRange)
                            .font(MyFont.callout)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 40)
                    
                    HStack (spacing: 10) {
                        Image(systemName:"mappin.and.ellipse")
                            .foregroundColor(Color.black)
                        Text(location)
                            .font(MyFont.callout)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 40)
                    
                    HStack {
                        // Learn more button
                        ZStack {
                            Capsule()
                                .frame(width: 76, height: 19)
                                .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                            Text("Learn more")
                                .font(MyFont.caption)
                                .foregroundColor(Color.white)
                        }.padding(.leading, 10)
                        
                        Spacer()
                        
                        // Audience pills
                        ZStack {
                            Capsule()
                                .frame(width: 76, height: 19)
                                .foregroundColor(Color(red: 1, green: 0.921, blue: 0.642))
                            Text("Students")
                                .font(MyFont.caption)
                                .foregroundColor(Color.black)
                        }.padding(.leading, 10)
                        ZStack {
                            Capsule()
                                .frame(width: 76, height: 19)
                                .foregroundColor(Color(red: 0.908, green: 0.908, blue: 0.908))
                            Text("Public")
                                .font(MyFont.caption)
                                .foregroundColor(Color.black)
                        }.padding(.leading, 3)
                    }.padding(.horizontal, 28)
                }.background(Rectangle()
                    .fill(MyFont.lightestGray)
                    .frame(width: (UIScreen.main.bounds.width - 48), height: (UIScreen.main.bounds.width - 48))
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2))
                
            }
        }
    }
    
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(eventTitle: "Gospel Forum", dateRange: "April 21 to 23, 2023", location: "Hilton Parsippany", image: "gospelforum")
    }
}
