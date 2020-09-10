//
//  SearchProductAPI.swift
//  ShareCore
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import Foundation
import NetworkCore
import RxSwift
import CoreDataSource
import CoreEntities

struct SearchProductAPI {
    
    let service: NetworkService
}

extension SearchProductAPI: SearchProductRemoteDataSourceType {
    
    func getItemsSearch(product: String) -> Observable<SearchProduct> {
        
        let requestModel = SearchProductRequestModel(productName: product)
        let endpoint = SearchProductEndpoint.search(data: requestModel)
        let request: Observable<NetworkCoreData<SearchProductResponseModel>> = service.request(target: endpoint)
        
        return request.flatMap { (responseModel) -> Observable<SearchProduct> in
            if let search = responseModel.data?.mapToSearch() {
                return .just(search)
            } else if let searchError = responseModel.getError() {
                return .error(searchError)
            }
            
            return .error("unespecified")
        }
    }
}
