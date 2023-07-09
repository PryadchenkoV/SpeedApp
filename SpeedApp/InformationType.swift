//
//  InformationType.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 19.09.2021.
//

import Foundation

enum InformationType: String {
    case speed
    case altitude
    case maxAltitude
    case maxSpeed
    case avgSpeed
    
    var localized: String {
        switch self {
        case .speed: return String(localized: "Speed")
        case .altitude: return String(localized: "Altitude")
        case .maxSpeed: return String(localized: "Maximum Speed")
        case .avgSpeed: return String(localized: "Average Speed")
        case .maxAltitude: return String(localized: "Maximum Altitude")
        }
    }
}

