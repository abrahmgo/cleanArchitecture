//
//  ProductsFactory.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

struct ProductsFactory {
    
    static func makeProducts(coordinator: ProductsCoordinator) -> ProductsViewController {
        
        // MARK: ViewModel
        let dependencies = ProductsDependencies()
        let viewModel = ProductsViewModel(dependencies: dependencies)
        
        // MARK: ViewController
        let viewController = ProductsViewController(coordinator: coordinator, viewModel: viewModel)
        return viewController
    }
}
