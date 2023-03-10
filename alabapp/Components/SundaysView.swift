//
//  SundaysView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct SundaysView: View {
    
    @EnvironmentObject var network: Network
    
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
    
    let pillWidth = CGFloat((UIScreen.main.bounds.width - 48.0))
    let miniPillWidth = 145.0
    
    var body: some View {
        VStack (spacing: 14) {
            Text("Sundays")
                .font(MyFont.title)
                .foregroundColor(MyFont.black)
                .frame(width: pillWidth, height: 35, alignment: .topLeading)
            
            // Toggle between NYC and Boston info
            ZStack (alignment: .leading) {
                ZStack (alignment: .trailing) {
                    Capsule()
                        .frame(width: pillWidth, height: 54)
                        .foregroundColor(MyFont.lightestGray)
                    Text("NYC")
                        .offset(x: -254)
                        .font(MyFont.headline)
                        .foregroundColor(toggleToNewYork ? MyFont.darkBlue : MyFont.lightGray)
                    Text("Boston")
                        .offset(x: -50)
                        .font(MyFont.subheadline)
                        .foregroundColor(MyFont.lightGray)
                }
                ZStack {
                    Capsule()
                        .frame(width: miniPillWidth, height: 50)
                        .foregroundColor(.white)
                    Text(toggleToNewYork ? "NYC" : "Boston")
                        .foregroundColor(MyFont.darkBlue)
                }
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                .offset(x:toggleToNewYork ? 2: (pillWidth - miniPillWidth - 4))
                .animation(Animation.spring(), value: toggleToNewYork)
            }
            .onTapGesture {
                self.toggleToNewYork.toggle()
            }
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Image("building")
                        .padding(.leading, 10)
                    Text(toggleToNewYork ? network.sundayService.first(where: { $0.values.city == "New York City" })?.values.address ??
                         "141st St & Amsterdam Ave, Manhattan" : network.sundayService.first(where: { $0.values.city == "Boston" })?.values.address ?? "929 Mass Ave, Cambridge")
                    .font(MyFont.callout)
                    .foregroundColor(MyFont.black)
                }
                HStack {
                    Image("time")
                        .padding(.leading, 10)
                    Text("Service starts at " + (toggleToNewYork ? network.sundayService.first(where: { $0.values.city == "New York City" })?.values.serviceTime ??
                         "10:30 AM" : network.sundayService.first(where: { $0.values.city == "Boston" })?.values.serviceTime ?? "4:30 PM"))
                    .font(MyFont.callout)
                    .foregroundColor(MyFont.black)
                }
                HStack {
                    Image("personcheck")
                        .padding(.leading, 10)
                    Text(toggleToNewYork ? network.sundayService.first(where: { $0.values.city == "New York City" })?.values.audienceString ?? " Open to all" : network.sundayService.first(where: { $0.values.city == "Boston" })?.values.audienceString ?? " Open to students")
                        .font(MyFont.callout)
                        .foregroundColor(MyFont.black)
                    Spacer()
                }
                if !toggleToNewYork { HStack {
                    Image("chat")
                        .padding(.leading, 10)
                    Text(network.sundayService.first(where: { $0.values.city == "Boston" })?.values.howToAttend ?? "Contact us to attend in person")
                        .font(MyFont.callout)
                        .foregroundColor(MyFont.black)
                }
                    
                }
            }.frame(width: pillWidth)
            
            if toggleToNewYork {
                HStack (spacing: 50) {
                    ZStack {
                        Capsule()
                            .frame(width:130, height:51)
                            .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                        Button(action: {
                            openYoutube(youtubeId: network.sundayService.first(where: {$0.values.city == "New York City" })?.values.thisWeekLink ?? "McJAL7aaLvs")
                        }) {Text("Stream: " + (network.sundayService.first(where: {$0.values.city == "New York City" })?.values.thisWeekDate ?? "Feb 19"))
                                .font(MyFont.subheadline)
                            .foregroundColor(MyFont.white)}
                    }
                    ZStack {
                        Capsule()
                            .frame(width:130, height:51)
                            .foregroundColor(Color(red: 0.961, green: 0.961, blue: 0.961))
                        Button(action:{
                            openYoutube(youtubeId: network.sundayService.first(where: {$0.values.city == "New York City" })?.values.lastWeekLink ?? "oZO2uuRfUuA")
                        }) {Text("Watch: " + (network.sundayService.first(where: {$0.values.city == "New York City" })?.values.lastWeekDate ?? "Feb 12"))
                                .font(MyFont.subheadline)
                                .foregroundColor(MyFont.lightBlue)
                        }
                    }
                }.frame(width: pillWidth)
                
            }
            
        }.onAppear {
            network.getSundayService()
        }
    }
}

struct SundaysView_Previews: PreviewProvider {
    static var previews: some View {
        SundaysView().environmentObject(Network())
    }
}
