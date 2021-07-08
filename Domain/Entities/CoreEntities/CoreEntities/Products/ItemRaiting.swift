//
//  ItemRaiting.swift
//  CoreEntities
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

public struct ItemRaiting: Hashable {

    public let ratingValue: Double
    public let reviewCount: Int
    
    public init(ratingValue: Double, reviewCount: Int) {
        self.ratingValue = ratingValue
        self.reviewCount = reviewCount
    }
}
