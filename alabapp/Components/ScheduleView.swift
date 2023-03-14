//
//  ScheduleView.swift
//  alabapp
//
//  Created by Janet Lee on 3/1/23.
//

import SwiftUI

struct ScheduleView: View {
    let event: EventMeta
    @EnvironmentObject var network: Network
    
    let scheduleW = CGFloat(UIScreen.main.bounds.width - 48.0)
    let colorIndicatorW = 8.0
    let colorIndicatorTotalW = 16.0
    
    enum EventType: Int {
        case Meal = 0
        case Session = 1
    }
    
    func formattedDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let s = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        return dateFormatter.string(from: s!)
    }
    
    func timeFormatted(_ time: String) -> String {
        let start = time.index(time.startIndex, offsetBy: 11)
        let end = time.index(time.endIndex, offsetBy: -13)
        let range = start..<end
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: String(time[range]))
        dateFormatter.dateFormat = "h:mm a"
        let Date12 = dateFormatter.string(from: date!)
        return Date12
    }
    
    func schedulingComponent(_ eventType: EventType, _ startTime: String, _ endTime: String, _ title: String,  _ location: String) -> some View {
        return HStack(spacing: 0) {
            Rectangle()
                .frame(width: colorIndicatorW, height: 80)
                .foregroundColor(eventType == EventType.Meal ? MyFont.mediumBlue : MyFont.yellow)
                .padding(.trailing, 8)
                .cornerRadius(8)
            Spacer(minLength: 4)
            Grid() {
                GridRow {
                    Text(startTime)
                        .gridColumnAlignment(.trailing)
                        .font(MyFont.callout)
                    Text(title)
                        .fontWeight(.bold)
                        .font(MyFont.headline)
                        .gridColumnAlignment(.leading)
                        .padding(.leading, 10)
                    Spacer()
                }
                GridRow {
                    Text(endTime)
                        .font(MyFont.callout)
                        .gridColumnAlignment(.trailing)
                    Text(location)
                        .font(MyFont.callout)
                        .padding(.leading, 10)
                    Spacer()
                }
            }.frame(width: scheduleW - colorIndicatorTotalW - 10)
            Spacer(minLength: 20)
        }.background(
            Rectangle()
                .fill(MyFont.lightestGray)
                .cornerRadius(8)
                .frame(width: scheduleW, height: 80)
        ).padding(.horizontal, 24)
    }
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                
                ForEach(network.days) { day in
                    Text(formattedDate(day.name))
                        .font(MyFont.title3)
                        .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 0))
                    
                    ForEach(day.items) {item in
                        schedulingComponent(EventType(rawValue: item.values.eventType) ?? EventType.Meal, timeFormatted(item.values.startTime), timeFormatted(item.values.endTime), item.values.name, item.values.location)
                    }
                }
            }
        }.onAppear {
            network.getSchedule(event: event)
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let gospelForum = EventMeta(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", isHappeningNow: 1, audience: "Open to all", codaName: "gospelForum23", posterUrl: "gospelforum", detailedViewBannerUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl--EJLBQhYZ3/6bf1018f29524ece9e915356f446b0195dabb0453b4327dbbcabfd6bdd656fee7a468387b683793e58e8063a77b0e6d0e3bf89e8b133b089d289a1e13c1d7833be1ef9399c9939d4028a9b4940bc63a5c3cde8d2b64e028c62df02640a20edc4683aa9f0", audiencePills: "Students,Public"))
        
        ScheduleView(event: gospelForum).environmentObject(Network())
    }
}
