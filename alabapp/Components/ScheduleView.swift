//
//  ScheduleView.swift
//  alabapp
//
//  Created by Janet Lee on 3/1/23.
//

import SwiftUI

struct ScheduleView: View {
    let scheduleW = CGFloat(UIScreen.main.bounds.width - 48.0)
    let colorIndicatorW = 8.0
    let colorIndicatorTotalW = 16.0
    
    @State var agendaItemList = [AgendaItem]()
    
    enum EventType: Int {
        case Meal = 0
        case Session = 1
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
                .foregroundColor(eventType == EventType.Meal ? .brown : .blue)
                .padding(.trailing, 8)
                .cornerRadius(8)
            Grid() {
                GridRow {
                    Text(startTime)
                        .gridColumnAlignment(.trailing)
                    Text(title)
                        .fontWeight(.bold)
                        .gridColumnAlignment(.leading)
                }.frame(width: 180)
                GridRow {
                    Text(endTime)
                        .gridColumnAlignment(.trailing)
                    Text(location)
                }.frame(width: 180)
            }.frame(width: scheduleW - colorIndicatorTotalW)
            Spacer(minLength: 20)
        }.background(
            Rectangle()
                .fill(Color(red: 0.961, green: 0.961, blue: 0.961))
                .cornerRadius(8)
                .frame(width: scheduleW, height: 80)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2)
        ).padding(.horizontal, 24)
    }
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text("Friday, April 21")
                    .font(.title2)
                    .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 0))
                
                ForEach(agendaItemList) {agendaItem in
                    schedulingComponent(EventType(rawValue: agendaItem.values.eventType) ?? EventType.Meal, timeFormatted(agendaItem.values.startTime), timeFormatted(agendaItem.values.endTime), agendaItem.values.name, agendaItem.values.location)
                }
            }
        }.onAppear {
            ScheduleAPI().getData() { agendaItemList in
                self.agendaItemList = agendaItemList
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
