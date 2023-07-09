//
//  FooterButtonView.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 09.07.2023.
//

import SwiftUI

struct FooterButtonView: View {
    
    @Binding var locationManager: LocationManager
    
    var body: some View {
        HStack {
            if locationManager.isUpdatedInProgress {
                Button("Stop") {
                    locationManager.stopUpdatingLocation()
                }
                Spacer()
                Button("Reset") {
                    locationManager.resetData()
                }
            } else {
                Button("Start") {
                    locationManager.startUpdateLocationIfAllowed()
                }
                if !locationManager.maxSpeed.value.isZero ||
                    !locationManager.maxAltitude.value.isZero {
                    Spacer()
                    Button("Reset") {
                        locationManager.resetData()
                    }
                    Button("Save") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    FooterButtonView(locationManager: .constant(LocationManager()))
}
