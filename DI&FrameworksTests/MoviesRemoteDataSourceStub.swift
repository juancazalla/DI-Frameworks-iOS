//
//  MoviesRemoteDataSourceStub.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 12/6/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain
import Data
import BrightFutures
import Result

struct MoviesRemoteDataSourceStub: MoviesRemoteDataSourceType {

    let movies: [Domain.Movie]
    
    init(movies: [Domain.Movie]) {
        self.movies = movies
    }
    
    func getMoviesByTitle(title: String) -> Future<[Domain.Movie], GetMoviesError> {
        return future { () -> Result<[Domain.Movie], GetMoviesError> in
            return Result.Success(self.movies)
        }
    }
}
