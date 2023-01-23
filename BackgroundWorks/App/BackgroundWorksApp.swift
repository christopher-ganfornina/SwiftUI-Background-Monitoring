//
//  BackgroundWorksApp.swift
//  BackgroundWorks
//
//  Created by Christopher Ganfornina on 23/1/23.
//

import SwiftUI

@main
struct BackgroundWorksApp: App {

    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .manageAppPhase(of: scenePhase)
    }
}
