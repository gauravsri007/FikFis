//
//  FikFisApp.swift
//  FikFis
//
//  Created by apple on 31/07/24.
//
//

import SwiftUI

@main
struct FikFisApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
//            if let isLoggedIn = Udefault.value(forKey: KEY_IS_LOGGEDIN) as? Bool {
//                if isLoggedIn {
//                    TabV()
//                }
//                else {
//                    LoginV()
//                }
//            }
//            else{
//                LoginV()
//            }
        }
        
    }
}


//class AppDelegate: NSObject, UIApplicationDelegate {
//    
//    func application(_ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//        print("App has launched.")
//        registerForPushNotifications()
//
//        return true
//    }
//    
//}
