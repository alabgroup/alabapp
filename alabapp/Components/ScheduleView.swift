//
//  ScheduleView.swift
//  alabapp
//
//  Created by Janet Lee on 3/1/23.
//

import SwiftUI

struct ScheduleView: View {
    let scheduleW = CGFloat((UIScreen.main.bounds.width - 48.0))
    
    enum EventType {
        case Meal
        case Session
    }
    
    func schedulingComponent(_ eventType: EventType, _ startTime: String, _ endTime: String, _ title: String,  _ location: String) -> some View {
        return HStack(spacing: 10) {
            Rectangle()
                .frame(width: 8, height: 80)
                .foregroundColor(eventType == EventType.Meal ? .brown : .blue)
                .padding(.trailing, 8)
                .cornerRadius(8)
            Spacer(minLength: 40)
            VStack (alignment: .leading) {
                Text(startTime)
                Text(endTime)
            }
            VStack (alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                Text(location)
            }
            Spacer(minLength: 10)
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
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Friday, April 21")
                    .font(.title2)
                    .padding(.leading, 24)
                
                Group {
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                    schedulingComponent(EventType.Session, "5:00 PM", "10:00 PM", "Session", "Salon I")
                    schedulingComponent(EventType.Meal, "10:00 PM", "11:30 PM", "Pizza", "Silvermine II")
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                }
                
                Text("Saturday, April 22")
                    .font(.title2)
                    .padding(.leading, 24)
                
                Group {
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                    schedulingComponent(EventType.Session, "5:00 PM", "10:00 PM", "Session", "Salon I")
                    schedulingComponent(EventType.Meal, "10:00 PM", "11:30 PM", "Pizza", "Silvermine II")
                    schedulingComponent(EventType.Meal, "5:00 PM", "7:00 PM", "Dinner", "Silvermine II")
                }
                
                Text("Sunday, April 23")
                    .font(.title2)
                    .padding(.leading, 24)
                
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
