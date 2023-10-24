//
//  FirebaseAnalyticsApp.swift
//  FirebaseAnalytics
//
//  Created by apple on 10/23/23.
//

import SwiftUI
import Firebase

@main
struct FirebaseAnalyticsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Firebase Configured!")
        return true
    }
}
