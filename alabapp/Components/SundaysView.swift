//
//  SundaysView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct SundaysView: View {
    
    // Attempt to open Youtube if it is installed in the user's
    // device. Fall back to opening their web browser.
    func openYoutube(youtubeId: String) {
        var youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(youtubeUrl as URL) {
            UIApplication.shared.open(youtubeUrl as URL)
        } else {
            youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.open(youtubeUrl as URL)
            
        }
    }
    
    @State var toggleToNewYork = true
    
    var body: some View {
        VStack (spacing: 14) {
            Text("Sundays")
                .font(MyFont.title)
                .foregroundColor(MyFont.black)
                .frame(width: 325, height: 35, alignment: .topLeading)
            ZStack (alignment: .leading) {
                ZStack (alignment: .trailing) {
                    Capsule()
                        .frame(width: 325, height: 54)
                        .foregroundColor(Color(red: 0.961, green: 0.961, blue: 0.961))
                    Text("NYC")
                        .offset(x: -234)
                        .font(MyFont.headline)
                        .foregroundColor(MyFont.darkBlue)
                    Text("Boston")
                        .offset(x: -50)
                        .font(MyFont.subheadline)
                        .foregroundColor(MyFont.lightGray)
                }
                ZStack {
                    Capsule()
                        .frame(width:145, height:50)
                        .foregroundColor(.white)
                    Text(toggleToNewYork ? "NYC" : "Boston")
                        .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                }
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                .offset(x:toggleToNewYork ? 2: 175)
                .animation(Animation.spring(), value: toggleToNewYork)
            }
            .onTapGesture {
                self.toggleToNewYork.toggle()
            }
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Image("building")
                    Text(toggleToNewYork ? "141st St & Amsterdam Ave, Manhattan" : "929 Mass Ave, Cambridge")
                        .font(MyFont.callout)
                        .foregroundColor(MyFont.black)
                }
                HStack {
                    Image("time")
                    Text(toggleToNewYork ? "Service starts at 10:30 AM" : "Service starts at 4:30 PM")
                        .font(MyFont.callout)
                        .foregroundColor(MyFont.black)
                }
                HStack {
                    Image("personcheck")
                    Text(toggleToNewYork ? " Open to all" : " Open to students")
                        .font(MyFont.callout)
                        .foregroundColor(MyFont.black)
                }
                HStack {
                    Image("chat")
                    Text("Contact us to attend in person")
                        .font(MyFont.callout)
                        .foregroundColor(MyFont.black)
                }
            }
            
            if toggleToNewYork {
                HStack (spacing: 50) {
                    ZStack {
                        Capsule()
                            .frame(width:130, height:51)
                            .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                        Button(action: {
                            openYoutube(youtubeId: "McJAL7aaLvs")
                        }) {Text("Stream: Feb 19")
                                .font(MyFont.headline)
                                .foregroundColor(MyFont.white)}
                    }
                    ZStack {
                        Capsule()
                            .frame(width:130, height:51)
                            .foregroundColor(Color(red: 0.961, green: 0.961, blue: 0.961))
                        Button(action:{
                            openYoutube(youtubeId: "oZO2uuRfUuA")
                        }) {Text("Watch: Feb 12")
                                .font(MyFont.headline)
                                .foregroundColor(MyFont.lightBlue)
                        }
                    }
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
