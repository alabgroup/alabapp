//
//  SundaysView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct SundaysView: View {
    var body: some View {
        VStack (spacing: 14) {
            Text("Sundays")
                .fontWeight(.medium)
                .font(.title)
                .frame(width: 325, height: 35, alignment: .topLeading)
            ZStack (alignment: .leading) {
                ZStack (alignment: .trailing) {
                    Capsule()
                        .frame(width: 325, height: 54)
                        .foregroundColor(Color(red: 0.961, green: 0.961, blue: 0.961))
                    Text("Boston")
                        .offset(x: -30)
                        .foregroundColor(Color(red: 0.741, green: 0.741, blue: 0.741))
                }
                ZStack {
                    Capsule()
                        .frame(width:145, height:50)
                        .foregroundColor(.white)
                    Text("NYC")
                        .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                }
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                .offset(x: 2)
                // .padding(24)
            }
            
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Image("building")
                    Text("141st St & Amsterdam Ave, Manhattan")
                }
                HStack {
                    Image("time")
                    Text("Service starts at 10:30 AM")
                }
                HStack {
                    Image("personcheck")
                    Text(" Open to all")
                }
                HStack {
                    Image("chat")
                    Text("Contact us to attend in person")
                }
            }
            
            HStack (spacing: 50){
                ZStack {
                    Capsule()
                        .frame(width:130, height:51)
                        .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                    Text("Stream: Feb 19")
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
                ZStack {
                    Capsule()
                        .frame(width:130, height:51)
                        .foregroundColor(Color(red: 0.961, green: 0.961, blue: 0.961))
                    Text("Watch: Feb 12")
                        .font(.caption)
                        .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                }
            }
        }
    }
}

struct SundaysView_Previews: PreviewProvider {
    static var previews: some View {
        SundaysView()
    }
}
