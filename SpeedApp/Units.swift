//
//  Units.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 02.07.2023.
//

import Foundation

public enum Units: String, Codable, CaseIterable, Equatable {
    case imperial = "Imperial"
    case metric = "Metric"
}

extension Units {
    var toDimensionSpeed: UnitSpeed {
        self == .imperial ? .milesPerHour : .kilometersPerHour
    }

    var toDimentionLength: UnitLength {
        self == .imperial ? .feet : .kilometers
    }
}
