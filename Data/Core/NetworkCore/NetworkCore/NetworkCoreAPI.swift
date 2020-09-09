//
//  NetworkCoreAPI.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

public struct NetworkCoreAPI {
    
    public static func setup(with config: NetworkCoreAPIConfigType.Type) {
        NetworkCoreAPIConfig.shared = NetworkCoreAPIConfig(config)
    }
}
