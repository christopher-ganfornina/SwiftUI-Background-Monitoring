//
//  LocationManager.swift
//  BackgroundWorks
//
//  Created by Christopher Ganfornina on 23/1/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {

    static let shared = LocationManager()

    var locationManager: CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.activityType = .automotiveNavigation
        locationManager.allowsBackgroundLocationUpdates = true

        super.init()

        locationManager.delegate = self
    }

    func requestAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }

    func startMonitoringLocationChanges() {
        locationManager.startUpdatingLocation()
    }

    func stopMonitoringLocationChanges() {
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("CLLOCATION: Did Start Monitoring For Region (\(region)")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("CLLOCATION: Did update locations (\(locations)")
    }

    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        print("CLLOCATION: Did Pause Location Updates (\(manager)")
    }

}
