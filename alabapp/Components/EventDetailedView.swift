//
//  EventDetailedView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventDetailedView: View {
    var body: some View {
        ScrollView {
            ZStack (alignment: .top) {
                VStack {
                    Image("gospelForumBanner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea(.all)
                        .frame(height: 150)
                        .cornerRadius(0)
                    
                    Text("Gospel Forum")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 361, height: 0, alignment: .topLeading)
                        .offset(x: 10, y: -70.50)
                    
                    
                    VStack(spacing: 20) {
                        AnnouncementsView()
                        
                        NavigationView() {
                            HStack(spacing: 2) {
                                Spacer()
                                VStack (spacing: 2) {
                                    Image(systemName:"info.bubble")
                                    Text("Info")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack (spacing: 2) {
                                    Image(systemName:"calendar")
                                    Text("Schedule")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack (spacing: 2) {
                                    Image(systemName:"mappin")
                                    Text("Location")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack (spacing: 2) { Image(systemName:"hand.raised")
                                    Text("Contact")
                                        .font(.caption)
                                }
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                }
            }
        }.ignoresSafeArea(.all)
    }
}

struct EventDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailedView()
    }
}
