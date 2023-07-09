//
//  SpeedAppApp.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 19.09.2021.
//

import SwiftUI

@main
struct SpeedApp: App {

    @State var settingsManager: SettingsModel = SettingsModel()
    @State var locationManager: LocationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            MainView(settingsModel: $settingsManager, locationManager: $locationManager)
                .modelContainer(for: SessionItem.self)
        }
    }
}
