//
//  LocationManager.swift
//  SpeedApp
//
//  Created by Ivan Pryadchenko on 26.09.2021.
//

import CoreLocation
import SwiftUI

@Observable
class LocationManager: NSObject {
    // MARK: - Public
    public var speed: Measurement<Dimension> = Measurement(value: 0, unit: UnitSpeed.metersPerSecond)
    public var maxSpeed: Measurement<Dimension> = Measurement(value: 0, unit: UnitSpeed.metersPerSecond)
    public var altitude: Measurement<Dimension> = Measurement(value: 0, unit: UnitLength.meters)
    public var maxAltitude: Measurement<Dimension> = Measurement(value: 0, unit: UnitLength.meters)
    public var averageSpeed: Measurement<Dimension> = Measurement(value: 0, unit: UnitSpeed.metersPerSecond)

    public var coordinates = [CLLocationCoordinate2D]()

    public var isUpdatedInProgress: Bool = false
    public var isAuthorized: Bool = false
    
    // MARK: - Private
    private let locationManager = CLLocationManager()
    private var timerSpeed: Timer?
    private var timerCoordinated: Timer?
    private var secondsCount = 1.0
    private var isAddingSumSpeedAllowed = true
    private var speedSum = Measurement(value: 0, unit: UnitSpeed.metersPerSecond)
    
    override init() {
        super.init()
        locationManager.delegate = self
        isAuthorized = locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways
        locationManager.requestAlwaysAuthorization()
    }

    // MARK: - Public function
    public func resetData() {
        maxSpeed = Measurement(value: 0, unit: UnitSpeed.metersPerSecond)
        maxAltitude = Measurement(value: 0, unit: UnitLength.meters)
        coordinates.removeAll()
        secondsCount = 1.0
    }

    public func startUpdateLocationIfAllowed() {
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            timerSpeed = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
                self?.secondsCount += 1.0
                self?.isAddingSumSpeedAllowed = true
            })
            locationManager.startUpdatingLocation()
            isUpdatedInProgress = true
        }
    }

    public func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        speed = Measurement(value: 0.0, unit: UnitSpeed.metersPerSecond)
        altitude = Measurement(value: 0.0, unit: UnitLength.meters)
        timerSpeed?.invalidate()
        timerCoordinated?.invalidate()
        isUpdatedInProgress = false
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        isAuthorized = manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        if location.horizontalAccuracy >= 0 {
            coordinates.append(location.coordinate)
        }
        if location.speedAccuracy >= 0 {
            speed = Measurement(value: location.speed, unit: UnitSpeed.metersPerSecond)
            maxSpeed = max(maxSpeed, speed)
            if isAddingSumSpeedAllowed {
                speedSum = Measurement(value: speedSum.value + speed.value, unit: .metersPerSecond)
                averageSpeed = Measurement(value: speedSum.value / secondsCount, unit: UnitSpeed.metersPerSecond)
                isAddingSumSpeedAllowed = false
            }
        }
        if location.verticalAccuracy >= 0 {
            altitude = Measurement(value: location.altitude, unit: UnitLength.meters)
            maxAltitude = max(maxAltitude, altitude)
        }
    }
}

extension LocationManager {
    static let coordinatesAddingTime = 5.0
}
