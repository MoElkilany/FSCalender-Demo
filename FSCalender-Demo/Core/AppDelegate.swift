//
//  AppDelegate.swift
//  FSCalender-Demo
//
//  Created by Mohamed Elkilany on 29/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewVC()
        window?.makeKeyAndVisible()
        return true
    }
}

