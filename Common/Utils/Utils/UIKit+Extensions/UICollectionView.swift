//
//  UICollectionView.swift
//  Utils
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
extension NSObject: ClassNameProtocol { }

public extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type, withNib: Bool = true, bundle: Bundle? = nil) {
        
        let className = cellType.className
        
        if withNib {
            let nib = UINib(nibName: className, bundle: bundle)
            register(nib, forCellWithReuseIdentifier: className)
        } else {
            register(cellType, forCellWithReuseIdentifier: className)
        }
    }
    
    func register<T: UICollectionReusableView>(reusableViewType: T.Type,
                                               ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                               bundle: Bundle? = nil) {
        let className = reusableViewType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    func register<T: UICollectionReusableView>(reusableViewTypes: [T.Type],
                                               ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                               bundle: Bundle? = nil) {
        reusableViewTypes.forEach { register(reusableViewType: $0, ofKind: kind, bundle: bundle) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type,
                                                      for indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type,
                                                          for indexPath: IndexPath,
                                                          ofKind kind: String = UICollectionView.elementKindSectionHeader) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
