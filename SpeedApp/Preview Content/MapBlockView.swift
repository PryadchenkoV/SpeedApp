//
//  MapBlockView.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 09.07.2023.
//

import SwiftUI
import MapKit

struct MapBlockView: View {
    
    @Binding var locationManager: LocationManager
    @State var userLocation = MapCameraPosition.userLocation(fallback: .automatic)
    
    var body: some View {
        VStack {
            if locationManager.coordinates.count > 0 && !locationManager.isUpdatedInProgress {
                Map {
                    MapPolyline(coordinates: locationManager.coordinates, contourStyle: .straight)
                        .stroke(.blue, lineWidth: 5.0)
                    Marker("Start Point", coordinate: locationManager.coordinates.first!)
                    Marker("End Point", coordinate: locationManager.coordinates.last!)
                }
            } else if locationManager.isAuthorized {
                Map(position: $userLocation)
            } else {
                Text("Click start to update")
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .aspectRatio(1.0, contentMode: .fit)
        .background(.thinMaterial)
        .cornerRadius(25.0)
    }
}

#Preview {
    MapBlockView(locationManager: .constant(LocationManager()))
}
