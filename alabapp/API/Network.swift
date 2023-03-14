//
//  ScheduleAPI.swift
//  alabapp
//
//  Created by Janet Lee on 3/4/23.
//

import Foundation

// The Sunday Service info for the main page.
struct SundayServiceList : Decodable {
    var items: [SundayServiceMeta]
}

struct SundayServiceMeta : Decodable, Identifiable {
    var id: String
    var index: Int
    var values: SundayServiceContent
}

struct SundayServiceContent : Decodable {
    var city: String
    var serviceTime: String
    var address: String
    var audienceString: String
    var howToAttend: String
    var thisWeekDate: String
    var thisWeekLink: String
    var lastWeekDate: String
    var lastWeekLink: String
}

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

// The announcments for the main page.
struct AnnouncementList : Decodable {
    var items: [AnnouncementMeta]
}

struct AnnouncementMeta : Decodable, Identifiable {
    var id: String
    var index: Int
    var values: AnnouncementContent
}

struct AnnouncementContent : Decodable {
    var message: String
    var event: String
    var expiration: String
}

// The location info for an event.
struct LocationList : Decodable {
    var items: [LocationMeta]
}

struct LocationMeta : Decodable, Identifiable {
    var id: String
    var index: Int
    var values: LocationContent
}

struct LocationContent : Decodable {
    var title: String
    var message: String
    var icon: String
}

// The information for a given event.
struct InfoList : Decodable {
    var items: [InfoMeta]
}

struct InfoMeta : Decodable, Identifiable {
    var id: String
    var index: Int
    var values: InfoContent
}

struct InfoContent : Decodable {
    var title: String
    var message: String
}

// The event table.
struct EventList : Decodable {
    var items: [EventMeta]
}

struct EventMeta : Decodable, Identifiable {
    var id: String
    var index: Int
    var values: EventContent
}

struct EventContent : Decodable {
    var name: String
    var location: String
    var datesString: String
    var isHappeningNow: Int
    var audience: String
    var codaName: String
    var posterUrl: String
    var detailedViewBannerUrl: String
    var audiencePills: String
}

let AuthTokenString = "43376e32-b365-465f-88ce-a552783747fa"

class Network: ObservableObject {
    @Published var days = [Day]()
    @Published var announcements = [AnnouncementMeta]()
    @Published var locationInfo = [LocationMeta]()
    @Published var information = [InfoMeta]()
    @Published var events = [EventMeta]()
    @Published var sundayService = [SundayServiceMeta]()
    
    
    func getSundayService() {
        guard let url = URL(string: "https://coda.io/apis/v1/docs/t3DP5F4Tol/tables/sundayServiceInfo/rows?useColumnNames=true?valueFormat=rich?limit=40") else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {return }
            let decodedItems = try! JSONDecoder().decode(SundayServiceList.self, from: data)
            
            DispatchQueue.main.async {
                self.sundayService = decodedItems.items.sorted {$0.index < $1.index}
            }
        }
        task.resume()
    }
    
    func getSchedule(event: EventMeta) {
        
        self.days = [Day]()
        guard let url = URL(string: "https://coda.io/apis/v1/docs/t3DP5F4Tol/tables/schedule_\(event.values.codaName)/rows?useColumnNames=true?valueFormat=rich?limit=40") else {return}
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
                    self.days.append(Day(id: key, name: key, items: value.sorted(by: {$0.values.startTime < $1.values.startTime})))
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
            let decodedItems = try! JSONDecoder().decode(AnnouncementList.self, from: data)
            let formatter = ISO8601DateFormatter()
            let date = Date()
            DispatchQueue.main.async {
                self.announcements = decodedItems.items.sorted {$0.index < $1.index}.filter {announcementMeta in return announcementMeta.values.expiration > formatter.string(from: date)}
            }
        }
        task.resume()
    }
    
    func getLocationContent(event: EventMeta) {
        guard let url = URL(string: "https://coda.io/apis/v1/docs/t3DP5F4Tol/tables/location_\(event.values.codaName)/rows?useColumnNames=true?valueFormat=rich?limit=40") else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {return }
            let decodedItems = try! JSONDecoder().decode(LocationList.self, from: data)
            
            DispatchQueue.main.async {
                self.locationInfo = decodedItems.items.sorted {$0.index < $1.index}
            }
        }
        task.resume()
    }

    func getInfoContent(event: EventMeta) {
        guard let url = URL(string: "https://coda.io/apis/v1/docs/t3DP5F4Tol/tables/info_\(event.values.codaName)/rows?useColumnNames=true?valueFormat=rich?limit=40") else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {return }
            let decodedItems = try! JSONDecoder().decode(InfoList.self, from: data)
            
            DispatchQueue.main.async {
                self.information = decodedItems.items.sorted {$0.index < $1.index}
            }
        }
        task.resume()
    }

    func getEvents() {
        
        guard let url = URL(string: "https://coda.io/apis/v1/docs/t3DP5F4Tol/tables/events/rows?useColumnNames=true?valueFormat=rich?limit=40") else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {return }
            let decodedItems = try! JSONDecoder().decode(EventList.self, from: data)
            
            DispatchQueue.main.async {
                self.events = decodedItems.items.sorted {$0.index < $1.index}
            }
        }
        task.resume()
    }
}
