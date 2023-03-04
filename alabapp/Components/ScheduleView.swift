//
//  ScheduleView.swift
//  alabapp
//
//  Created by Janet Lee on 3/1/23.
//

import SwiftUI

struct ScheduleView: View {
    let scheduleW = CGFloat((UIScreen.main.bounds.width - 48.0))
    let colorIndicatorW = 8.0
    let colorIndicatorTotalW = 16.0
    
    enum EventType {
        case Meal
        case Session
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
                
                Group {
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                    schedulingComponent(EventType.Session, "5:00 PM", "10:00 PM", "Session", "Salon I")
                    schedulingComponent(EventType.Meal, "10:00 PM", "11:30 PM", "Pizza", "Silvermine II")
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                }
                
                Text("Saturday, April 22")
                    .font(.title2)
                    .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 0))
                
                Group {
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                    schedulingComponent(EventType.Session, "5:00 PM", "10:00 PM", "Session", "Salon I")
                    schedulingComponent(EventType.Meal, "10:00 PM", "11:30 PM", "Pizza", "Silvermine II")
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                }
                
                Text("Sunday, April 23")
                    .font(.title2)
                    .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 0))
                
                Group {
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                    schedulingComponent(EventType.Session, "5:00 PM", "10:00 PM", "Session", "Salon I")
                    schedulingComponent(EventType.Meal, "10:00 PM", "11:30 PM", "Pizza", "Silvermine II")
                    schedulingComponent(EventType.Session, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
