//
//  ActiveAppPhase.swift
//  BackgroundWorks
//
//  Created by Christopher Ganfornina on 23/1/23.
//

import CoreLocation

enum ActiveAppPhase {
    static func run() {
        LocationManager.shared.requestAuthorization()
        LocationManager.shared.stopMonitoringLocationChanges()
        BackgroundTaskManager.shared.stopBackgroundTask()
    }
}
