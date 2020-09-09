//
//  SplashViewModel + Dependencies.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

public protocol SplashViewModelOutputs {
    var isLoading: BehaviorRelay<Bool> { get }
    var error: PublishSubject<Error> { get }
    var update: PublishSubject<Void> { get }
    var login: PublishSubject<Void> { get }
}

public protocol SplashViewModelInputs { }

public protocol SplashViewModelType {
    var outputs: SplashViewModelOutputs { get }
    var inputs: SplashViewModelInputs { get }
}

public struct SplashDependencies {
    
}
