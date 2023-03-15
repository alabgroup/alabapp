//
//  EventDetailedView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventDetailedView: View {
    
    var event: EventMeta
    @EnvironmentObject var network: Network
    let tabW = CGFloat((UIScreen.main.bounds.width - 48.0) / 4.0)
    enum Page {
        case Info
        case Schedule
        case Location
        case Contact
    }
    
    @State private var currentPage = Page.Schedule

    func pageButton(_ select: Page, _ icon: String, _ title: String) -> some View {
        return Button {
            currentPage = select
        } label: {
            VStack {
                Image(systemName: icon)
                Text(title)
                    .font(MyFont.caption)
                if currentPage == select {
                    Rectangle()
                      .frame(height: 1)
                }
            }.frame(width: tabW)
        } .foregroundColor( currentPage == select ? Color.black : Color.gray )
    }
    
    var body: some View {
        
        ZStack (alignment: .top) {
            VStack {
                AsyncImage(url: URL(string: event.values.detailedViewBannerUrl))
                    .frame(height: 150)
                    .cornerRadius(0)
                
                
                Text(event.values.name)
                    .fontWeight(.bold)
                    .font(MyFont.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 361, height: 0, alignment: .topLeading)
                    .offset(x: 10, y: -70.50)
                
                
                VStack(spacing: 20) {
                    // Only pull the announcements relevant to that event
                    AnnouncementsView(announcements: network.announcements.filter {announcement in announcement.values.event == event.values.codaName})
                        .padding(.bottom, 6)
                    
                    // Navigation bar for Events Tab View
                    VStack() {
                        ScrollView(.horizontal) {
                            HStack() {
                                pageButton(Page.Schedule, "calendar", "Schedule")
                                pageButton(Page.Info, "info.bubble", "Info")
                                pageButton(Page.Location, "mappin", "Location")
                                pageButton(Page.Contact, "hand.raised", "Contact")
                            }.padding(.horizontal, 12)
                        }
                        
                        TabView (selection: $currentPage) {
                            
                            ScheduleView(event: event)
                                .tag(Page.Schedule)
                            InfoView(event: event)
                                .tag(Page.Info)
                            LocationView(event: event)
                                .tag(Page.Location)
                            ContactView()
                                .tag(Page.Contact)
                            
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                    }
                }
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.top)
    }
    
}

struct EventDetailedView_Previews: PreviewProvider {
    static var previews: some View {

        EventDetailedView(event: MyFont.gospelForum).environmentObject(Network())
    }
}
