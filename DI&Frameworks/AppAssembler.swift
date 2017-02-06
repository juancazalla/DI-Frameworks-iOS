//
//  AppAssembler.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 6/2/17.
//  Copyright © 2017 Juan Cazalla Estrella. All rights reserved.
//

import Foundation

protocol Assembler: SearchMoviesAssembler, MovieDetailsAssembler { }

class AppAssembler: Assembler { }
