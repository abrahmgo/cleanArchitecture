//
//  ProductsFactory.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import CoreUseCases
import ShareCore

struct ProductsFactory {
    
    static func makeProducts(coordinator: ProductsCoordinator) -> ProductsViewController {
        
        // MARK: API
        let searchProductAPI = ShareCoreRemoteDataSource.searchProduct
        
        // MARK: Usecases
        let getSearchProductUseCase = GetSearchProductsUseCase(searchProductRemoteDataSource: searchProductAPI)
        
        // MARK: ViewModel
        let dependencies = ProductsDependencies(getProducts: getSearchProductUseCase)
        let viewModel = ProductsViewModel(dependencies: dependencies)
        
        // MARK: ViewController
        let viewController = ProductsViewController(coordinator: coordinator, viewModel: viewModel)
        return viewController
    }
}
