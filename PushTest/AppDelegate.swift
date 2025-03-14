//
//  AppDelegate.swift
//  PushTest
//
//  Created by Michael Miller on 3/14/25.
//

import UIKit
import Courier_iOS

class AppDelegate: CourierDelegate {

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
    
    override func pushNotificationDeliveredInForeground(message: [AnyHashable : Any]) -> UNNotificationPresentationOptions {
            
        print("\n=== 💌 Push Notification Delivered In Foreground ===\n")
        print(message)
        print("\n=================================================\n")
        
        // This is how you want to show your notification in the foreground
        // You can pass "[]" to not show the notification to the user or
        // handle this with your own custom styles
        return [.sound, .list, .banner, .badge]
        
    }
    
    override func pushNotificationClicked(message: [AnyHashable : Any]) {
        
        print("\n=== 👉 Push Notification Clicked ===\n")
        print(message)
        print("\n=================================\n")
        
    }

}
