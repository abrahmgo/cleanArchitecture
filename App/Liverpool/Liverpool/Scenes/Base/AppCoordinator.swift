//
//  AppCoordinator.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import RxSwift
import Utils

struct AppCoordinator: Coordinator {
    
    var window: UIWindow
    var disposeBag: DisposeBag
    
    init(window: UIWindow) {
        self.window = window
        self.disposeBag = DisposeBag()
    }
    
    func start() {
        
        setTheme()
        
        let splashCoordinator = SplashCoordinator()
        splashCoordinator.start()
    }
    
    private func setTheme() {
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 24)]
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = false
        
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
    }
}

extension Coordinator {
        
    func setRootViewController(_ viewController: UIViewController?) {
        
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else {
            return
        }
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
