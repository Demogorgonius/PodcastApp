//
//  AppDelegate.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import UIKit
import PodcastIndexKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        PodcastIndexKit.setup(apiKey: "D45ZGFQ26LEQC7D4D5PW", apiSecret: "ECjvzUTaqq3QK7LRA^RjWgbmmCfCcK9q#9pKAA53", userAgent: "MyiOSApp/1.0 (iPhone; iOS 15.0; Scale/2.0)")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

