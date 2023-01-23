//
//  BackgroundAppPhase.swift
//  BackgroundWorks
//
//  Created by Christopher Ganfornina on 23/1/23.
//

import Foundation

enum BackgroundAppPhase {
    static func run() {
        LocationManager.shared.startMonitoringLocationChanges()
        BackgroundTaskManager.shared.startBackgroundTask()
    }
}
