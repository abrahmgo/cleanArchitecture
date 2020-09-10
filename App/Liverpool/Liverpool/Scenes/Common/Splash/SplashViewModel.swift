//
//  SplashViewModel.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import RxSwift
import RxCocoa

public class SplashViewModel: SplashViewModelType, SplashViewModelInputs, SplashViewModelOutputs {
    
    // MARK: Properties
    public var outputs: SplashViewModelOutputs { return self }
    public var inputs: SplashViewModelInputs { return self }
    
    // MARK: Inputs
    
    // MARK: Outputs
    public let isLoading = BehaviorRelay<Bool>(value: false)
    public let error = PublishSubject<Error>()
    public let products = PublishSubject<Void>()
    public let update = PublishSubject<Void>()
    
    // MARK: Private
    private let dependencies: SplashDependencies
    private let disposeBag = DisposeBag()
    
    public init(dependencies: SplashDependencies) {
        self.dependencies = dependencies
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.products.onNext(())
        }
    }
}
