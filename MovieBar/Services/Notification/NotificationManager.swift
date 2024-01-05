//
//  NotificationManager.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 2.01.24.
//

import Foundation
import UserNotifications

final class NotificationManager {

    static let shared = NotificationManager()
    private init() {}
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: ", error.localizedDescription)
            } else {
                print("Notification success")
            }
        }
    }
    
    func scheduleNotification(after: TimeInterval) {
        
        let content = UNMutableNotificationContent()
        content.title = "Новый фильм доступен к просмотру!"
        content.subtitle = "Только сегодня: полная версия - бесплатно!"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: after, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: "main",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func removeNotification() {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["main"])
    }
    
}

