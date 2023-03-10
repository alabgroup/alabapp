//
//  ContentView.swift
//  Homepage navigation bar for Alab App.
//
//  Created by Joane Joseph on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView{
            HomeView()
                .tabItem() {
                    Image("home")
                    Text("Home")
                        .font(MyFont.caption2)
                        .foregroundColor(MyFont.lightGray)
                }
            EventsView()
                .tabItem() {
                    Image("calendar")
                    Text("Events")
                        .font(MyFont.caption2)
                        .foregroundColor(MyFont.lightGray)
                }
            GiveView()
                .tabItem() {
                    Image("give")
                    Text("Give")
                        .font(MyFont.caption2)
                        .foregroundColor(MyFont.lightGray)
                }
        }.accentColor(MyFont.black)

    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
