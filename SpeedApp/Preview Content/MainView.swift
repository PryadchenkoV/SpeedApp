//
//  MainView.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 19.09.2021.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var sessions: [SessionItem]
    
    @Binding var settingsModel: SettingsModel
    @Binding var locationManager: LocationManager
    
    var body: some View {
        NavigationView {
            VStack {
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
                ScrollView() {
                    LazyVGrid(columns: columns) {
                        InformationBlockView(measurement: $locationManager.speed, settingsModel: $settingsModel, informationType: .speed)
                        InformationBlockView(measurement: $locationManager.altitude, settingsModel: $settingsModel, informationType: .altitude)
                        InformationBlockView(measurement: $locationManager.maxSpeed, settingsModel: $settingsModel, informationType: .maxSpeed)
                        InformationBlockView(measurement: $locationManager.maxAltitude, settingsModel: $settingsModel, informationType: .maxAltitude)
                        InformationBlockView(measurement: $locationManager.averageSpeed, settingsModel: $settingsModel, informationType: .avgSpeed)
                        MapBlockView(locationManager: $locationManager)
                    }
                }
                Spacer()
                FooterButtonView(locationManager: $locationManager)
            }
            .padding(.horizontal)
            .navigationTitle("Main Screen")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView(settingsModel: settingsModel)
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(settingsModel: .constant(SettingsModel()), locationManager: .constant(LocationManager()))
    }
}
