//
//  ScheduleAPI.swift
//  alabapp
//
//  Created by Janet Lee on 3/4/23.
//

import Foundation

struct Schedule : Decodable {
    var items: [AgendaItem]
}

struct AgendaItem : Decodable, Identifiable {
    var id : String
    var name: String
    var values: RowContent
}

struct RowContent: Decodable {
    var startTime: String
    var endTime: String
    var name: String
    var location: String
    var eventType: Int
}

// Figure out the completion
class ScheduleAPI {
    
    func getData(completion:@escaping ([AgendaItem]) -> ()) {
        
        guard let url = URL(string: "https://coda.io/apis/v1/docs/t3DP5F4Tol/tables/schedule_gospel_forum/rows?useColumnNames=true?valueFormat=rich?limit=40") else {
            return}
        var urlRequest = URLRequest(url: url)
        let AuthTokenString = ""
        urlRequest.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                return }
            let agendaItemList = try! JSONDecoder().decode(Schedule.self, from: data)
            print(agendaItemList)
            DispatchQueue.main.async {
                completion(agendaItemList.items)
              
            }
        }
        task.resume()
    }
}
