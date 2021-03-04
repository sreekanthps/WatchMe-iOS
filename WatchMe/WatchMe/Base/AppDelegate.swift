//
//  AppDelegate.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    // MARK: Application Launch
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupGoogleMaps()
        setupHomeViewController(launchOptions)
        return true
    }

    
    // MARK: Setup Splash Router
    private func setupHomeViewController(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            let mainVC =  SplashViewController()
            navigationController = UINavigationController(rootViewController: mainVC)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    // MARK: Setup Google Maps
    private func setupGoogleMaps(){
        GMSServices.provideAPIKey(Constants.apiKey)
    }


}

