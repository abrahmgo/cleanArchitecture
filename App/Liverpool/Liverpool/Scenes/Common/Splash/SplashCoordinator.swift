//
//  SplashCoordinator.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import Utils

public struct SplashCoordinator: Coordinator {
    
    private var splashViewController: SplashViewController?
    
    public init() {
        self.splashViewController = SplashFactory.makeSplash(coordinator: self)
    }
    
    public func start() {
        
        guard let splashViewController = splashViewController else {
            return
        }
        
        setRootViewController(splashViewController)
    }
}

extension SplashCoordinator {
    
    func goToProducts() {
        
        let products = ProductsCoordinator()
        products.start()
    }
}

