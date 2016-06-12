//
//  NetworkCondemorStub.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 12/6/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import BrightFutures
import Alamofire

@testable import Data

public struct NetworkStub: Networking {
    
    public let filename: String
    
    public func request(method: Data.Method, _ URLString: String,
                        parameters: [String : AnyObject]?) -> Future<NSData, NetworkError> {
        
        let moviesPromise = Promise<NSData, NetworkError>()
        moviesPromise.success(self.moviesData())
        return moviesPromise.future
    }
}

private extension NetworkStub {
    func moviesData() -> NSData {
        let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json")
        return NSData(contentsOfFile: path!)!
    }
}
