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
        ZStack (alignment: .topLeading) {
            
            // Event title and info
            VStack(alignment: .leading, spacing: 10) {
                Text("Gospel Forum")
                    .font(.title)
                    .padding(.leading, 40)
                HStack (spacing: 10) {
                    Image(systemName:"calendar")
                    Text ("April 21 to 23, 2023")
                }.padding(.leading, 40)
                HStack (spacing: 10) {
                    Image(systemName:"mappin.and.ellipse")
                    Text ("Hilton Parsippany")
                }.padding(.leading, 40)
                
                // Learn more button
                ZStack {
                    Capsule()
                        .frame(width: 152, height: 34)
                        .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                    NavigationLink(destination: GiveView()) {
                        Text("Learn more")
                            .font(.headline)
                            .foregroundColor(Color.white)
                    }
                }.padding(.leading, 40)
            }.background(Rectangle()
                .fill(Color(red: 0.961, green: 0.961, blue: 0.961))
                .cornerRadius(8)
                .frame(width: 325, height: 170)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2))
            
            
            // Event date card
            VStack(alignment: .center) {
                Text("21")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Apr")
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
            }.background(
                Rectangle()
                    .fill(Color(red: 0.741, green: 0.741, blue: 0.741))
                    .cornerRadius(8)
                    .frame(width: 62, height: 65)
            ).offset(x: -25, y: -35)
        }
    }
    
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView()
    }
}
