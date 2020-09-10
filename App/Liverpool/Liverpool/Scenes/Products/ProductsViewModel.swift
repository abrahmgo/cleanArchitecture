//
//  ProductsViewModel.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import RxSwift
import RxCocoa

public class ProductsViewModel: ProductsViewModelType, ProductsViewModelInputs, ProductsViewModelOutputs {
    
    // MARK: Properties
    public var outputs: ProductsViewModelOutputs { return self }
    public var inputs: ProductsViewModelInputs { return self }
    
    // MARK: Inputs
    
    // MARK: Outputs
    public let components = BehaviorRelay<[ProductsComponent]>(value: [])
    public let isLoading = BehaviorRelay<Bool>(value: false)
    public let error = PublishSubject<Error>()
    
    // MARK: Private
    private let dependencies: ProductsDependencies
    private let disposeBag = DisposeBag()
    
    public init(dependencies: ProductsDependencies) {
        self.dependencies = dependencies
        
        dependencies.getProducts.execute(product: "product")
            .subscribe(onNext: { [weak self] (search) in
              
                let items = search.itemListElement
                let itemsData = items.map({ProductViewData(item: $0, imgProduct: nil)})
                let itemsComponent = itemsData.map({ProductsComponent.product(viewData: $0)})
                
                self?.components.accept(itemsComponent)
                
            }, onError: { (error) in
                self.error.onNext(error)
            }).disposed(by: disposeBag)
    }
}
