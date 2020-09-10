//
//  ResizableCollectionViewCell.swift
//  Utils
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import UIKit

open class ResizableCollectionViewCell: UICollectionViewCell {
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutIfNeeded()
        
        layoutAttributes.frame.size = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize,
                                                              withHorizontalFittingPriority: .required,
                                                              verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
    
    public func addShadow() {
        clipsToBounds = false
    }
}
