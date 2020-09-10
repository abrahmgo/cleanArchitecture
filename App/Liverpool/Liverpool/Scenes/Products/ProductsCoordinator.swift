//
//  ProductsCoordinator.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import Utils

public struct ProductsCoordinator: Coordinator {
    
    private var productsViewController: ProductsViewController?
    
    public init() {
        self.productsViewController = ProductsFactory.makeProducts(coordinator: self)
    }
    
    public func start() {
        
        guard let productsViewController = productsViewController else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: productsViewController)
        setRootViewController(navigationController)
    }
}
