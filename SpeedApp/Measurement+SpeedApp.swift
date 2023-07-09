//
//  Measurement.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 19.09.2021.
//

import Foundation

extension Measurement {
    func dimention(for units: Units) -> Dimension {
        switch self.unit {
        case is UnitSpeed:
            return units == .metric ? UnitSpeed.kilometersPerHour : UnitSpeed.milesPerHour
        case is UnitLength:
            return units == .metric ? UnitLength.meters : UnitLength.feet
        default:
            fatalError("Unknown measure Unit")
        }
    }

    var localizedType: String? {
        switch self.unit {
        case is UnitSpeed:
            return String(localized: "Speed")
        case is UnitLength:
            return String(localized: "Altitude")
        default:
            return nil
        }
    }
}
