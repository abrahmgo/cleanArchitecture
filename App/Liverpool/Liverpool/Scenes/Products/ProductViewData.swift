//
//  ProductViewData.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import Components
import CoreEntities
import UIKit

struct ProductViewData: ProductViewDataType {
    
    let item: Item
    
    var title: String {
        guard let itemTitle = item.item?.name else {
            return ""
        }
        
        return itemTitle
    }
    
    var imgProduct: UIImage?
    
    var price: String {
        return ""
    }
    
    var imgRaiting: UIImage? {
        guard let raiting = item.item?.aggregateRating?.ratingValue else {
            return UIImage(named: "")
        }
        
        let imgName = ScaleRating(scale: raiting)
        return UIImage(named: imgName.img)
    }
    
    var noReviews: String {
        guard let itemNoReviews = item.item?.aggregateRating?.reviewCount else {
            return "0"
        }
        
        return "\(itemNoReviews)"
    }
}
