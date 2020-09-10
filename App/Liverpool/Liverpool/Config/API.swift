//
//  API.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

enum APIBundle: String {
    
    case production = "PRODUCTION"
    case development = "DEV"
    
    var server: String {
        switch self {
        case .production:
            return "https://www.liverpool.com.mx/"
        case .development:
            return "https://www.liverpool.com.mx/"
        }
    }
}
