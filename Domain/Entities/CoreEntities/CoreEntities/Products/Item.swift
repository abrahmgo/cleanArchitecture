//
//  Item.swift
//  CoreEntities
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

public struct Item: Hashable {

    public let position: Int
    public let item: ItemInformation?

    public init(position: Int, item: ItemInformation?) {
        self.position = position
        self.item = item
    }
}
