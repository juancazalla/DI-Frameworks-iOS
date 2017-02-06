//
//  GetMoviesByTitle.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 11/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import BrightFutures

public enum GetMoviesError: Error {
    case connectionError, unknownError
}

public protocol GetMoviesByTitleType {
    func execute(_ movieTitle: String) -> Future<[Movie], GetMoviesError>
}

open class GetMoviesByTitle: GetMoviesByTitleType {

    let moviesRepository: MoviesRepositoryType

    public init(moviesRepository: MoviesRepositoryType) {
        self.moviesRepository = moviesRepository
    }

    open func execute(_ movieTitle: String) -> Future<[Movie], GetMoviesError> {
        return moviesRepository.getMoviesByTitle(movieTitle)
    }
}
