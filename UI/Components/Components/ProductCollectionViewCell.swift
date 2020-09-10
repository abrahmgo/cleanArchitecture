//
//  ProductCollectionViewCell.swift
//  Components
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import Utils
import Nuke

public protocol ProductViewDataType {
    
    var title: String { get }
    var imgProduct: URL? { get }
    var price: String { get }
    var imgRaiting: UIImage? { get }
    var noReviews: String { get }
}

public class ProductCollectionViewCell: ResizableCollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgRaiting: UIImageView!
    @IBOutlet weak var lblNoReviews: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func config(viewData: ProductViewDataType) {
        lblTitle.text = viewData.title
        lblPrice.text = viewData.price
        imgRaiting.image = viewData.imgRaiting
        lblNoReviews.text = viewData.noReviews
        if let imgUrl = viewData.imgProduct {
            Nuke.loadImage(with: imgUrl, into: imgProduct)
        }
    }
}
