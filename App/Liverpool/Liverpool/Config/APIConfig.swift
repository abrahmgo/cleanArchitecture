//
//  APIConfig.swift
//  Liverpool
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import NetworkCore

struct APIConfig: NetworkCoreAPIConfigType {
    
    static var baseURL: String {
        #if DEBUG
        
        return APIBundle.development.server
        
        #else
        return APIBundle.production.server
        
        #endif
    }
    
    static var useSampleData: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    static var additionalHeaders: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded", "PLATFORM-ORIGIN": "konfio-ios"]
    }
}
