//
//  AppPhase.swift
//  BackgroundWorks
//
//  Created by Christopher Ganfornina on 23/1/23.
//

import SwiftUI

extension Scene {
    func manageAppPhase(of scenePhase: ScenePhase) -> some Scene {
        self
            .onChange(of: scenePhase) { newValue in
                switch newValue {
                case .active:
                    ActiveAppPhase.run()
                case .background:
                    BackgroundAppPhase.run()
                case .inactive:
                    break
                @unknown default:
                    break
                }
            }
    }
}
