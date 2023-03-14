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
    
    @State private var currentPage = Page.Info

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
                                pageButton(Page.Info, "info.bubble", "Info")
                                pageButton(Page.Schedule, "calendar", "Schedule")
                                pageButton(Page.Location, "mappin", "Location")
                                pageButton(Page.Contact, "hand.raised", "Contact")
                            }.padding(.horizontal, 12)
                        }
                        
                        TabView (selection: $currentPage) {
                            
                            InfoView(event: event)
                                .tag(Page.Info)
                            ScheduleView(event: event)
                                .tag(Page.Schedule)
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
        
        let gospelForum = EventMeta(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", isHappeningNow: 1, audience: "Open to all", codaName: "gospelForum23", posterUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl-GzgdR6wQjp/133b1e17e8d1b760724c6079d69a3a08163d19ce068334f8ce0b9ff839e848fb968c74cd5888137802703cab3b41cdc9f2357c8c0dc5722b481c8338a04c3b12b2a8d05ef70708dfd324963c10b347f2d0cb4358c5b32cc98cc66df1ab71595968ef0ee4", detailedViewBannerUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl--EJLBQhYZ3/6bf1018f29524ece9e915356f446b0195dabb0453b4327dbbcabfd6bdd656fee7a468387b683793e58e8063a77b0e6d0e3bf89e8b133b089d289a1e13c1d7833be1ef9399c9939d4028a9b4940bc63a5c3cde8d2b64e028c62df02640a20edc4683aa9f0", audiencePills: "Students,Public"))
        
        EventDetailedView(event: gospelForum).environmentObject(Network())
    }
}
