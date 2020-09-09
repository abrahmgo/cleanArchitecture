//
//  Error.swift
//  Utils
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

public extension Error {
    
    var code: Int { return (self as NSError).code }
    var message: String { return (self as NSError).localizedDescription }
    var domain: String { return (self as NSError).domain }
}
