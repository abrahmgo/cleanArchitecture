//
//  SearchProductRemoteDataSource.swift
//  CoreDataSource
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import RxSwift
import CoreEntities

public protocol SearchProductRemoteDataSourceType {
    
    func getItemsSearch(product: String) -> Observable<SearchProduct>
}
