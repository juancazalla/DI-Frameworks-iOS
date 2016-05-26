//
//  Networking.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 21/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Alamofire

public protocol Networking {
    func request(method: Alamofire.Method, _ URLString: URLStringConvertible, parameters: [String:AnyObject]?) -> Request
}

public struct Network: Networking {
    
    public init() {}
    
    public func request(method: Alamofire.Method, _ URLString: URLStringConvertible, parameters: [String:AnyObject]?) -> Request {
        return Alamofire.request(method, URLString, parameters: parameters)
    }
}
