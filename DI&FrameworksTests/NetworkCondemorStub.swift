//
//  NetworkCondemorStub.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 12/6/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import BrightFutures
import Alamofire

@testable import enum Data.Method
@testable import Data

public struct NetworkStub: Networking {

    public let filename: String

	public func request(_ method: Method, _ URLString: String, parameters: [String : AnyHashable]?) -> Future<Data, NetworkError> {

		let moviesPromise = Promise<Data, NetworkError>()
		moviesPromise.success(self.moviesData())
		return moviesPromise.future
	}
}

private extension NetworkStub {
    func moviesData() -> Data {
        let path = Bundle.main.path(forResource: filename, ofType: "json")
        return (try! Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
