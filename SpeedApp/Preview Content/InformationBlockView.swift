//
//  InformationBlockView.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 19.09.2021.
//

import SwiftUI

struct InformationBlockView: View {
    
    @Binding var measurement: Measurement<Dimension>
    @Binding var settingsModel: SettingsModel
    var informationType: InformationType
    
    var body: some View {
        let convertedMeasurement = MeasurementConverter.convert(measurement: measurement, to: settingsModel.measureUnits)
        VStack {
            Spacer()
            VStack {
                Text(String(format: "%.1f", convertedMeasurement.value))
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                Text(convertedMeasurement.unit.symbol)
                    .font(.caption2)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(informationType.localized)
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .aspectRatio(1.0, contentMode: .fit)
        .background(.thinMaterial)
        .cornerRadius(25.0)
    }
}

struct InformationBlockView_Previews: PreviewProvider {
    static var previews: some View {
        InformationBlockView(measurement: .constant(Measurement(value: 22.0, unit: UnitSpeed.kilometersPerHour)), settingsModel: .constant(SettingsModel()), informationType: .speed)

    }
}
