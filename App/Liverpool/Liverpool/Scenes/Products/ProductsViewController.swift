//
//  ProductsViewController.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import RxSwift
import Utils
import Components

public class ProductsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let customFlowLayout = FlowLayout()
            customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            customFlowLayout.minimumLineSpacing = 0

            collectionView.register(cellType: ProductCollectionViewCell.self, bundle: ComponentsConstants.bundle)
            collectionView.collectionViewLayout = customFlowLayout
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    private let coordinator: ProductsCoordinator
    private let viewModel: ProductsViewModelType
    private let disposeBag = DisposeBag()
    
    private var components: [ProductsComponent] = []
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(coordinator: ProductsCoordinator,
                viewModel: ProductsViewModelType) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: ProductsViewController.typeName, bundle: Bundle(for: type(of: self)))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupBindings()
        localize()
    }
    
    private func setup() { }
    
    private func setupBindings() {
        
        viewModel.outputs.components
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (components) in
                self?.components = components
                self?.collectionView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    private func localize() { }
}

// MARK: - UICollectionViewDataSource

extension ProductsViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return components.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let component = components[indexPath.row]
        
        switch component {
        case .product(let viewData):
            let cell = collectionView.dequeueReusableCell(with: ProductCollectionViewCell.self, for: indexPath)
            cell.config(viewData: viewData)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension ProductsViewController: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let component = components[indexPath.row]
        
        switch component {
        case .product(let viewData):
            guard let data = viewData as? ProductViewData else {
                return
            }
            
            guard let url = data.item.item?.url else {
                return
            }
            
            showWebPage(urlWebPage: url)
        }
    }
}
