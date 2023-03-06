//
//  ScheduleAPI.swift
//  alabapp
//
//  Created by Janet Lee on 3/4/23.
//

import Foundation

// The schedule has the list of all of the agenda items for the entire event.
struct Schedule : Decodable {
    var items: [AgendaItem]
}

// For a given day, we have a list of agenda items (based on start time).
struct Day : Identifiable {
    var id: String
    let name : String
    var items : [AgendaItem]
}

struct AgendaItem : Decodable, Identifiable {
    var id : String
    var name: String
    var index: Int
    var values: RowContent
}

struct RowContent: Decodable {
    var startTime: String
    var endTime: String
    var name: String
    var location: String
    var eventType: Int
}

// The schedule has the list of all of the agenda items for the entire event.
struct AnnouncementsList : Decodable {
    var items: [Announcement]
}

struct Announcement : Decodable, Identifiable {
    var id: String
    var index: Int
    var values: AnnouncementContent
}

struct AnnouncementContent : Decodable {
    var message: String
    var expiration: String
}

let AuthTokenString = ""

class Network: ObservableObject {
    @Published var announcements = [Announcement]()
    @Published var days = [Day]()
    
    func getSchedule() {
        
        guard let url = URL(string: "https://coda.io/apis/v1/docs/t3DP5F4Tol/tables/schedule_gospel_forum8/rows?useColumnNames=true?valueFormat=rich?limit=40") else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {return }
            let decodedItems = try! JSONDecoder().decode(Schedule.self, from: data)
            
            DispatchQueue.main.async {
                let schedule = decodedItems.items.sorted {$0.index < $1.index}
                let groupedItems = Dictionary(grouping: schedule ) { String($0.values.startTime.prefix(10)) }
                let sortedItems = groupedItems.sorted( by: { $0.0 < $1.0 })
                for (key, value) in sortedItems {
                    self.days.append(Day(id: key, name: key, items: value))
                }
                
            }
        }
        task.resume()
    }
    
    func getAnnouncements() {
        
        guard let url = URL(string: "https://coda.io/apis/v1/docs/t3DP5F4Tol/tables/announcements/rows?useColumnNames=true?valueFormat=rich?limit=40") else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {return }
            let decodedItems = try! JSONDecoder().decode(AnnouncementsList.self, from: data)
            
            DispatchQueue.main.async {
                self.announcements = decodedItems.items.sorted {$0.index < $1.index}
            }
        }
        task.resume()
    }
}
