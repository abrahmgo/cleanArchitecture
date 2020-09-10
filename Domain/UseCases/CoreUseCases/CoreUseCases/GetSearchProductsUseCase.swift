//
//  GetSearchProductsUseCase.swift
//  CoreUseCases
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import CoreEntities
import CoreDataSource
import RxSwift

public protocol GetSearchProductsUseCaseType {
    func execute(product: String) -> Observable<SearchProduct>
}

public struct GetSearchProductsUseCase: GetSearchProductsUseCaseType {
    
    private let searchProductRemoteDataSource: SearchProductRemoteDataSourceType
    
    public init(searchProductRemoteDataSource: SearchProductRemoteDataSourceType) {
        self.searchProductRemoteDataSource = searchProductRemoteDataSource
    }
    
    public func execute(product: String) -> Observable<SearchProduct> {
        
        return searchProductRemoteDataSource.getItemsSearch(product: product)
    }
}
