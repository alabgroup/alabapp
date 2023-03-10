//
//  EventCardView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventCardView : View {
    let event: EventMeta
    let default_image = "AlabCityView"

    func getSafeImage(named: String) -> Image {
       let uiImage =  (UIImage(named: named) ?? UIImage(named: default_image))!
       return Image(uiImage: uiImage)
    }
    
    var body: some View {
        // Event card
        NavigationLink(destination: EventDetailedView(event: event)) {
            ZStack (alignment: .topLeading) {
                
                // Event title and info
                VStack(alignment: .leading, spacing: 10) {
                    getSafeImage(named: event.values.imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: (UIScreen.main.bounds.width - 48), height: 200)
                        .padding([.horizontal], 24)
                    
                    Text(event.values.name)
                        .font(MyFont.title3)
                        .foregroundColor(Color.black)
                        .padding(.leading, 40)
                    
                    HStack (spacing: 10) {
                        Image(systemName:"calendar")
                            .foregroundColor(Color.black)
                        Text(event.values.datesString)
                            .font(MyFont.callout)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 40)
                    
                    HStack (spacing: 10) {
                        Image(systemName:"mappin.and.ellipse")
                            .foregroundColor(Color.black)
                        Text(event.values.location)
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
        let gospelForum = EventMeta(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", audience: "Open to all", codaName: "gospelForum23" , imageUrl: "gospelforum"))
        EventCardView(event: gospelForum)
    }
}
