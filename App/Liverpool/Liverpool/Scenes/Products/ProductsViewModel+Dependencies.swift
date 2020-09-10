//
//  ProductsViewModel+Dependencies.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public protocol ProductsViewModelOutputs {
    var components: BehaviorRelay<[ProductsComponent]> { get }
    var isLoading: BehaviorRelay<Bool> { get }
    var error: PublishSubject<Error> { get }
}

public protocol ProductsViewModelInputs { }

public protocol ProductsViewModelType {
    var outputs: ProductsViewModelOutputs { get }
    var inputs: ProductsViewModelInputs { get }
}

public struct ProductsDependencies { }
