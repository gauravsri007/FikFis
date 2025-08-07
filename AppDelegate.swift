//
//  AppDelegate.swift
//  FikFis
//
//  Created by apple on 16/11/24.
//

import Foundation
import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        print("App has launched.")
        registerForPushNotifications()
        return true
    }
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else if let error = error {
                print("Permission denied: \(error.localizedDescription)")
            }
        }
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("App will enter the foreground.")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App did enter the background.")
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        // Convert device token to a string
        let token = deviceToken.map { String(format: "%02x", $0) }.joined()
        print("Device Token: \(token)")
        
        // Save token to UserDefaults or pass to SwiftUI
        Udefault.set(token, forKey: KEY_DEVICE_TOKEN)
        Udefault.synchronize()
        print("Before Device Token: \(Udefault.value(forKey: KEY_DEVICE_TOKEN) ?? "No token")")

    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        print("Failed to register for remote notifications: \(error.localizedDescription)")
    }
}
