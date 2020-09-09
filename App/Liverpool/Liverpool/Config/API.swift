//
//  API.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

enum APIBundle: String {
    
    // NOTE: values in Settings.bundle/Root.plist must match these
    case production = "PRODUCTION"
    case development = "DEV"
    
    var server: String {
        switch self {
        case .production:
            return "https://platform.konfio.mx"
        case .development:
            return "https://dev-platform.konfio.mx"
        }
    }
}
