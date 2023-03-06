//
//  alabappApp.swift
//  alabapp
//
//  Created by Joane Joseph on 2/25/23.
//

import SwiftUI

@main
struct alabappApp: App {
    var network = ScheduleAPI()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
