//
//  String.swift
//  Utils
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

extension String: LocalizedError {
    
    public var errorDescription: String? {
        return self
    }
}

public extension String {
    
    func toURL() -> URL? {
        return URL(string: self)
    }
}
