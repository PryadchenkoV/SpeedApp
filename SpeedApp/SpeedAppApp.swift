//
//  SpeedAppApp.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 19.09.2021.
//

import SwiftUI

@main
struct SpeedAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
