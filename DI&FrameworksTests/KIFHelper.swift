//
//  KIFHelper.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 11/6/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import XCTest
import KIF

extension XCTestCase {
    func tester(file: String = #file, line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file: String = #file, line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
