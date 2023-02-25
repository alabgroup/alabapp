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
                }
            EventsView()
                .tabItem() {
                    Image("calendar")
                    Text("Events")
                }
            GiveView()
                .tabItem() {
                    Image("give")
                    Text("Give")
                }
        }

    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
