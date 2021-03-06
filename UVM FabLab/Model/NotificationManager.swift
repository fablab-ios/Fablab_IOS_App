//
//  NotificationManager.swift
//  UVM FabLab
//
//  Created by Sam Clark on 4/25/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import Foundation
import CoreLocation
import UserNotifications
import UIKit

class NotificationManager: NSObject, CLLocationManagerDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    var fabWebAPI = FabWebAPI()
    var email = ""
    
    var count = 0
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("location updated")
        self.fetchAndDisplay()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("heading updated")
        self.fetchAndDisplay()
    }
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
    }
    
    func fetchAndDisplay() {
        fabWebAPI.getNotifications(searchTerm: self.email) { (notifications) in
            for notification in notifications {
                print(notification)
                self.displayNotification(title: notification.title, body: notification.message)
            }
        }
    }
    
    func displayNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
                                                        repeats: false)
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        notificationCenter.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
    }
    
    func testNotification() {
        let content = UNMutableNotificationContent()
        content.title = "some notification"
        content.body = "notification test"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10,
                                                        repeats: false)
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        notificationCenter.add(request, withCompletionHandler: { (error) in
            print("test")
            if let error = error {
                print(error)
            }
        })
    }
    
    func setEmail(email: String) {
        self.email = email
    }
}
