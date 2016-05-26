//
//  GetMoviesByTitle.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 11/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import BrightFutures

public enum GetMoviesError: ErrorType {
    case ConnectionError, UnknownError
}

public protocol GetMoviesByTitleType {
    func execute(movieTitle: String) -> Future<[Movie], GetMoviesError>
}

public class GetMoviesByTitle: GetMoviesByTitleType {

    let moviesRepository: MoviesRepository

    public init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }

    public func execute(movieTitle: String) -> Future<[Movie], GetMoviesError> {
        return moviesRepository.getMoviesByTitle(movieTitle)
    }
}
