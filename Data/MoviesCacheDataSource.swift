//
//  MoviesCacheDataSource.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 27/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain

public protocol MoviesCacheDataSourceType {
    func setMovies(_ movies: [Domain.Movie], title: String)
    
    func containsMoviesWithTitle(_ title: String) -> Bool
    
    func getMoviesByTitle(_ title: String) -> [Domain.Movie]
}

open class MoviesCacheDataSource: MoviesCacheDataSourceType {

    fileprivate var moviesMemoryCache: [String : [Domain.Movie]] = [ : ]

    public init() {

    }

    open func setMovies(_ movies: [Domain.Movie], title: String) {
        moviesMemoryCache[title] = movies
    }

    open func containsMoviesWithTitle(_ title: String) -> Bool {
        return moviesMemoryCache[title] != nil
    }

    open func getMoviesByTitle(_ title: String) -> [Domain.Movie] {
        guard let movies = moviesMemoryCache[title] else {
            return []
        }

        return movies
    }
}
