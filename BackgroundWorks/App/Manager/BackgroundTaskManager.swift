//
//  BackgroundTaskManager.swift
//  BackgroundWorks
//
//  Created by Christopher Ganfornina on 23/1/23.
//

import Foundation
import UserNotifications
import Combine

class BackgroundTaskManager {
    static let shared = BackgroundTaskManager()

    private lazy var subscriptions = Set<AnyCancellable>()
    private var timer: Timer?

    func startBackgroundTask() {
        timer = Timer.scheduledTimer(withTimeInterval: 15.0, repeats: true, block: { _ in
            self.performRequests()
        })
    }

    func stopBackgroundTask() {
        timer?.invalidate()
        subscriptions = Set<AnyCancellable>()
    }

    private func performRequests() {
        guard let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
          .map(\.data)
          .eraseToAnyPublisher()
          .sink { _ in
              print("✅ Task completed")
          } receiveValue: { _ in
              print("✅ Success")
              DispatchQueue.main.async {
                  UNNotification.handleRandomNotification()
              }
          }
          .store(in: &subscriptions)
    }
}

private extension UNNotification {
    static func handleRandomNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Request launched successfully"
        content.subtitle = "Go for it!"
        content.sound = UNNotificationSound.default
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false))
        UNUserNotificationCenter
            .current()
            .add(request)
    }
}
