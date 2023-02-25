//
//  HomeView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct HomeView: View {
    // SwiftUI
    var body: some View {
        ScrollView {
            ZStack (alignment: .top) {
                VStack {
                    Image("AlabCityView")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea(.all)
                        .frame(height: 254)
                        .cornerRadius(0)
                    // .offset(x: 0, y: -300.50)
                    
                    Text("Alabaster Group")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 361, height: 0, alignment: .topLeading)
                        .offset(x: 10, y: -100.50)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        AnnouncementsView()
                        ContactView()
                        SundaysView()
                
                    }.frame(maxWidth: 325, maxHeight: .infinity)
                }
            }
        }.ignoresSafeArea(.all)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
