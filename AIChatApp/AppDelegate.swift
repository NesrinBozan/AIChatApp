//
//  AppDelegate.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 6.12.2023.
//

import UIKit
import CoreData
import NeonSDK
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Font.configureFonts(font: .Inter)
//        FirebaseApp.configure()
        Neon.configure(window: &window, onboardingVC: TabbarController(), paywallVC: TabbarController(), homeVC: TabbarController())
        return true
    }
    
    
}
