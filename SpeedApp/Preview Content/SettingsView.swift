//
//  SettingsView.swift
//  SpeedApp
//
//  Created by Work on 08.10.2021.
//

import SwiftUI
import Combine

struct SettingsView: View {
    
    @State var settingsModel: SettingsModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Measuments")) {
                    Picker("Measuring Units", selection: $settingsModel.measureUnits) {
                        ForEach(Units.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                     }
                }
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settingsModel: SettingsModel())
    }
}
