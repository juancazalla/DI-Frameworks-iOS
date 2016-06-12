//
//  Networking.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 21/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import BrightFutures
import Alamofire

public enum Method: String {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}

public enum NetworkError: ErrorType {
    case UnknownError
}

public protocol Networking {
    func request(method: Method, _ URLString: String,
                 parameters: [String:AnyObject]?) -> Future<NSData, NetworkError>
}

public struct Network: Networking {
    
    public init() {}
    
    public func request(method: Method, _ URLString: String,
                        parameters: [String:AnyObject]?) -> Future<NSData, NetworkError> {
        
        let response = Promise<NSData, NetworkError>()

        Alamofire.request(Alamofire.Method.init(rawValue: method.rawValue)!, URLString, parameters: parameters)
            .response { _, _, data, error in
                guard let data = data where error == nil else {
                    response.failure(.UnknownError)
                    return
                }
                
                response.success(data)
        }
        
        return response.future
    }
}
