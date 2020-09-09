//
//  SplashFactory.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

struct SplashFactory {
    
    static func makeSplash(coordinator: SplashCoordinator) -> SplashViewController {
        
        // MARK: ViewModel
        let dependencies = SplashDependencies()
        let viewModel = SplashViewModel(dependencies: dependencies)
        
        // MARK: ViewController
        let viewController = SplashViewController(coordinator: coordinator, viewModel: viewModel)
        return viewController
    }
}
