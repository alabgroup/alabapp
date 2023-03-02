//
//  EventDetailedView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventDetailedView: View {
    let tabW = CGFloat((UIScreen.main.bounds.width - 48.0) / 4.0)
    enum Page {
        case Info
        case Schedule
        case Location
        case Contact
    }
    
    @State private var page = Page.Info
    
    func pageButton(_ select: Page, _ icon: String, _ title: String) -> some View {
        return Button {
            page = select
        } label: {
            VStack {
                Image(systemName: icon)
                Text(title)
                    .font(.caption)
            } .frame(width: tabW)
        } .foregroundColor( page == select ? Color.black : Color.gray )
    }
    
    
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
                            .padding(.bottom, 6)
                        
                        // Navigation bar for Events Tab View
                        VStack() {
                            ScrollView(.horizontal) {
                                HStack() {
                                    pageButton(Page.Info, "info.bubble", "Info")
                                    pageButton(Page.Schedule, "calendar", "Schedule")
                                    pageButton(Page.Location, "mappin", "Location")
                                    pageButton(Page.Contact, "hand.raised", "Contact")
                                }
                            }
                            
                            switch page {
                            case .Info:
                                InfoView()
                            case .Schedule:
                                ScheduleView()
                            case .Location:
                                HomeView()
                            case .Contact:
                                ContactView()
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                    
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
