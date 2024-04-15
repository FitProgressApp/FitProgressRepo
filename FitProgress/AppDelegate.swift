//
//  AppDelegate.swift
//  FitProgress
//
//  Created by Bryan Ceballos on 4/5/24.
//

import UIKit
import ParseSwift // Import ParseSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize ParseSwift with your Back4App credentials
        ParseSwift.initialize(
            applicationId: "wx9EbMPJ7jrw1nOncbhJ1JdUsBl9AmLCyT0lTpGI", // Replace with your actual Application ID from Back4App
            clientKey: "QqEpfXUlENmLsLEqJSlIStbuOQAgoHavhKohYszA", // Replace with your actual Client Key from Back4App; some apps may not have a client key
            serverURL: URL(string: "https://parseapi.back4app.com")! // Replace with your actual Server URL from Back4App
        )

        // Override point for customization after application launch.
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
