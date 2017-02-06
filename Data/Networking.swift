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

public enum NetworkError: Error {
    case unknownError
}

public protocol Networking {
    func request(_ method: Method, _ URLString: String,
                 parameters: [String: AnyHashable]?) -> Future<Data, NetworkError>
}

public struct Network: Networking {
    
    public init() {}
    
    public func request(_ method: Method, _ URLString: String,
                        parameters: [String: AnyHashable]?) -> Future<Data, NetworkError> {
        
        let response = Promise<Data, NetworkError>()
		Alamofire.request(URLString, method: HTTPMethod.init(rawValue: method.rawValue)!, parameters: parameters).responseData { dataResponse in
                guard let data = dataResponse.data, dataResponse.error == nil else {
                    response.failure(.unknownError)
                    return
                }

                response.success(data)
        }
        
        return response.future
    }
}
