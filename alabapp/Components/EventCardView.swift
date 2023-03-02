//
//  EventCardView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventCardView: View {
    var body: some View {
        // Event card
        NavigationLink(destination: EventDetailedView()) {
            ZStack (alignment: .topLeading) {
                
                // Event title and info
                VStack(alignment: .leading, spacing: 10) {
                    Image("gospelforum")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.horizontal], 24)
                    
                    Text("Gospel Forum")
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .padding(.leading, 40)
                    HStack (spacing: 10) {
                        Image(systemName:"calendar")
                            .foregroundColor(Color.black)
                        Text ("April 21 to 23, 2023")
                            .font(.callout)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 40)
                    HStack (spacing: 10) {
                        Image(systemName:"mappin.and.ellipse")
                            .foregroundColor(Color.black)
                        Text ("Hilton Parsippany")
                            .font(.callout)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 40)
                    
                    HStack {
                        // Learn more button
                        ZStack {
                            Capsule()
                                .frame(width: 76, height: 19)
                                .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                            Text("Learn more")
                                .font(.caption)
                                .foregroundColor(Color.white)
                        }.padding(.leading, 10)
                        
                        Spacer()
                        
                        // Audience pills
                        ZStack {
                            Capsule()
                                .frame(width: 76, height: 19)
                                .foregroundColor(Color(red: 1, green: 0.921, blue: 0.642))
                            Text("Students")
                                .font(.caption)
                                .foregroundColor(Color.black)
                        }.padding(.leading, 10)
                        ZStack {
                            Capsule()
                                .frame(width: 76, height: 19)
                                .foregroundColor(Color(red: 0.908, green: 0.908, blue: 0.908))
                            Text("Public")
                                .font(.caption)
                                .foregroundColor(Color.black)
                        }.padding(.leading, 3)
                    }.padding(.horizontal, 28)
                }.background(Rectangle()
                    .fill(Color(red: 0.961, green: 0.961, blue: 0.961))
                    .frame(width: (UIScreen.main.bounds.width - 48), height: ((UIScreen.main.bounds.width - 48) * 0.9))
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2))
                
            }
        }
    }
    
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView()
    }
}
