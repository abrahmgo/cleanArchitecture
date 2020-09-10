//
//  ScaleRating.swift
//  CoreEntities
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

public struct ScaleRating {

    public let scale: Double
    
    public init(scale: Double) {
        self.scale = scale
    }
    
    public var img: String {
        switch scale {
        case 0..<1:
            return ""
        case 1.1..<2:
            return ""
        case 2.1..<3:
            return ""
        case 3.1..<4:
            return ""
        case 4.1..<5:
            return ""
        default:
            return ""
        }
    }
}
