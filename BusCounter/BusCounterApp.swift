//
//  BusCounterApp.swift
//  BusCounter
//
//  Created by Michal Gruszkiewicz on 09/12/2021.
//

import SwiftUI

@main
struct BusCounterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
