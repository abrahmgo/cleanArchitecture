//
//  NetworkCoreConfig.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation

public protocol NetworkCoreAPIConfigType {
    static var baseURL: String { get }
    static var useSampleData: Bool { get }
    static var additionalHeaders: [String: String] { get }
}

public extension NetworkCoreAPIConfigType {
    
    static var additionalHeaders: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }
}

public final class NetworkCoreAPIConfig {
    
    // swiftlint:disable implicitly_unwrapped_optional
    public static var shared: NetworkCoreAPIConfig!
    
    public let baseURL: String
    public let useSampleData: Bool
    public let networkService: NetworkService
    
    init(_ config: NetworkCoreAPIConfigType.Type) {
        
        self.baseURL = config.baseURL
        self.useSampleData = config.useSampleData
        
        if config.useSampleData {
            self.networkService = MockNetworkProvider()
        } else {
            self.networkService = RequestNetworkProvider(httpAdditionalHeaders: config.additionalHeaders)
        }
    }
}
