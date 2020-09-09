//
//  NetworkService.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Utils

public protocol NetworkService {
    func request<T: Decodable>(target: NetworkTargetType) -> Observable<T>
}

public struct RequestNetworkProvider: NetworkService {
    
    private let manager: Session
    
    public init(timeoutIntervalForRequest: TimeInterval = 30,
                timeoutIntervalForResource: TimeInterval = 30,
                httpCookieAcceptPolicy: HTTPCookie.AcceptPolicy = .always,
                httpCookieStorage: HTTPCookieStorage = .shared,
                httpShouldSetCookies: Bool = true,
                httpAdditionalHeaders: [String: Any]) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutIntervalForRequest
        configuration.timeoutIntervalForResource = timeoutIntervalForResource
        configuration.httpCookieAcceptPolicy = httpCookieAcceptPolicy
        configuration.httpCookieStorage = httpCookieStorage
        configuration.httpShouldSetCookies = httpShouldSetCookies
        configuration.httpAdditionalHeaders = httpAdditionalHeaders
        
        self.manager = Session(configuration: configuration)
    }
    
    public func request<T>(target: NetworkTargetType) -> Observable<T> where T: Decodable {
        
        print("Server: \(target.toURL())")
        
        return Observable.create { observer -> Disposable in
            
            if target.retry {
                self.manager
                    .request(target.toURL(),
                             method: target.method,
                             parameters: target.parameters,
                             encoding: target.encoding,
                             headers: target.headers,
                             interceptor: nil)
                    .validate()
                    .responseDecodable { (response: DataResponse<T, AFError>) in
                        self.responseHandler(observer, response: response, target: target)
                }
            } else {
                self.manager
                    .request(target.toURL(),
                             method: target.method,
                             parameters: target.parameters,
                             encoding: target.encoding,
                             headers: target.headers,
                             interceptor: nil)
                    .responseDecodable { (response: DataResponse<T, AFError>) in
                        self.responseHandler(observer, response: response, target: target)
                }
            }
            
            return Disposables.create()
        }
    }
    
    private func responseHandler<Decodable>(_ observer: AnyObserver<Decodable>,
                                            response: DataResponse<Decodable, AFError>,
                                            target: NetworkTargetType) {
        if let _ = try? target.toURL().asURL() {
            
            let secureError = self.cleanError(response.value.debugDescription)
            
            var error = response.error?.localizedDescription
            
            if secureError.isEmpty == false {
                error = secureError
            }
            
            if let error = error {
                print("error \(error)")
            }
        }
        
        if let error = response.error {
            #if DEBUG
            observer.onError(error)
            #else
            observer.onError(ShareCoreError.unespecified)
            #endif
        } else if let value = response.value {
            observer.onNext(value)
        }
        
        observer.onCompleted()
    }
    
    private func cleanError(_ error: String) -> String {
        
        var secureError = error
        secureError = secureError.replacingOccurrences(of: "Optional(", with: "")
        secureError = secureError.replacingOccurrences(of: ")", with: "")
        
        if error.lowercased().contains("success") {
            secureError = ""
        }
        
        return secureError
    }
}

public struct MockNetworkProvider: NetworkService {
    
    public init() { }
    
    public func request<T>(target: NetworkTargetType) -> Observable<T> where T: Decodable {
        
        let endpoint = target.toURL()
        
        print("Mock: \(endpoint)")
        
        guard let sampleData = target.sampleData else {
            return .error("sampleData for \(endpoint) not implemented")
        }
        
        return Observable.create { observer in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
                if let decoded = try? JSONDecoder().decode(T.self, from: sampleData) {
                    observer.onNext(decoded)
                    observer.onCompleted()
                } else {
                    observer.onError("ShareCoreError.couldNotParseData")
                }
            }
            
            return Disposables.create()
        }
    }
}
