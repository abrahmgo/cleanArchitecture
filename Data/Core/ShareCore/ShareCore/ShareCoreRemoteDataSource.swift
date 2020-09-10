//
//  ShareCoreRemoteDataSource.swift
//  ShareCore
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import NetworkCore
import CoreDataSource

public struct ShareCoreRemoteDataSource {
    
    public static var bundle: Bundle? {
        return Bundle(identifier: "com.andres.ShareCore")
    }
    
    public static var searchProduct: SearchProductRemoteDataSourceType {
        return SearchProductAPI(service: NetworkCoreAPIConfig.shared.networkService)
    }
}
