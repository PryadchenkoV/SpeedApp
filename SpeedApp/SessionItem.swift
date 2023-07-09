//
//  SessionItem.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 02.07.2023.
//

import Foundation
import SwiftData

@Model
class SessionItem {
    @Attribute(.unique) var id: UUID
    var maxSpeed: Double
    var maxAltitude: Double
    
    init(id: UUID = UUID(), maxSpeed: Double = 0.0, maxAltitude: Double = 0.0) {
        self.id = id
        self.maxSpeed = maxSpeed
        self.maxAltitude = maxAltitude
    }
}
