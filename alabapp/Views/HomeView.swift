//
//  HomeView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct HomeView: View {
    // SwiftUI
    @EnvironmentObject var network: Network
    let screenW = CGFloat((UIScreen.main.bounds.width - 48.0))

    var body: some View {
        ScrollView {
            ZStack (alignment: .top) {
                VStack {
                    Image("AlabCityView")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea(.all)
                        .frame(height: 200)
                        .cornerRadius(0)
                    
                    Text("Alabaster Group")
                        .fontWeight(.bold)
                        .font(MyFont.largeTitle)
                        .foregroundColor(MyFont.white)
                        .frame(width: 361, height: 0, alignment: .topLeading)
                        .offset(x: 10, y: -80)
                    
                    VStack(alignment: .center, spacing: 30) {

                        if !network.announcements.isEmpty {
                                Text("Announcements")
                                    .fontWeight(.medium)
                                    .font(MyFont.title)
                                    .foregroundColor(MyFont.black)
                                    .frame(width: screenW, alignment: .topLeading)
                                    .padding(.bottom, 5)
                                
                                ForEach(network.announcements) { announcementInfo in
                                    Text(announcementInfo.values.message)
                                        .padding(.horizontal, 6)
                                        .font(MyFont.caption)
                                        .foregroundColor(MyFont.black)
                                        .frame(maxWidth: screenW, maxHeight: 70)
                                        .background(
                                            Rectangle()
                                                .fill(MyFont.lightestGray)
                                                .cornerRadius(8)
                                                .frame(width: screenW, height: 70)
                                                .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2)
                                        ).padding(.bottom, 30)
                                }
                        }
                        ContactView()
                        SundaysView()
                        
                    }.frame(maxWidth: 325, maxHeight: .infinity)
                }
            }
        }.ignoresSafeArea(.all)
            .onAppear {network.getAnnouncements()}
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Network())
    }
}
