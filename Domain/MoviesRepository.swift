//
//  MoviesRepository.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 17/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import BrightFutures

public protocol MoviesRepositoryType {
    func getMoviesByTitle(_ title: String) -> Future<[Movie], GetMoviesError>
}
