//
//  SearchesRemoteDataSource.swift
//  CoreDataSource
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import RxSwift

public protocol SearchesRemoteDataSource {
    
    func saveSearch(product: String) -> Observable<Void>
    func getSearches() -> Observable<[String]>
}
