//
//  MeasurementConverter.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 09.07.2023.
//

import Foundation

struct MeasurementConverter {
    public static func convert(measurement: Measurement<Dimension>, to unit: Units) -> Measurement<Dimension> {
        if measurement.unit is UnitLength {
            return measurement.converted(to: unit.toDimentionLength)
        } else if measurement.unit is UnitSpeed {
            return measurement.converted(to: unit.toDimensionSpeed)
        } else {
            fatalError("Unknown measurment, fix me")
        }
    }
}
