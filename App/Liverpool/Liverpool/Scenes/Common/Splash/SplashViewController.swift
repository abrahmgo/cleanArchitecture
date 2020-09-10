//
//  SplashViewController.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import RxSwift
import Utils

class SplashViewController: UIViewController {

    private let coordinator: SplashCoordinator
    private let viewModel: SplashViewModelType
    private let disposeBag = DisposeBag()
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(coordinator: SplashCoordinator,
                viewModel: SplashViewModelType) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: SplashViewController.typeName, bundle: Bundle(for: type(of: self)))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
    
    private func setupBindings() {
        
        viewModel.outputs.products
            .asObservable()
            .subscribe(onNext: { [weak self] (_) in
                self?.coordinator.goToProducts()
            }).disposed(by: disposeBag)
    }
}
