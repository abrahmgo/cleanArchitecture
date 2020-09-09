//
//  AppDelegate.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import NetworkCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        doAppCoordinator()
        return true
    }
}

// MARK: Setup

extension AppDelegate {
    
    func doAppCoordinator() {
        
        window = UIWindow()
        
        guard let window = window else {
            return
        }
        
        coordinator = AppCoordinator(window: window)
        coordinator?.start()
        window.makeKeyAndVisible()
    }
    
    func doNetworkCore() {
        NetworkCoreAPI.setup(with: APIConfig.self)
    }
}
