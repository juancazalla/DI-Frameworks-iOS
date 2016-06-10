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
    func setMovies(movies: [Domain.Movie], title: String)
    
    func containsMoviesWithTitle(title: String) -> Bool
    
    func getMoviesByTitle(title: String) -> [Domain.Movie]
}

public class MoviesCacheDataSource: MoviesCacheDataSourceType {

    private var moviesMemoryCache: [String : [Domain.Movie]] = [ : ]

    public init() {

    }

    public func setMovies(movies: [Domain.Movie], title: String) {
        moviesMemoryCache[title] = movies
    }

    public func containsMoviesWithTitle(title: String) -> Bool {
        return moviesMemoryCache[title] != nil
    }

    public func getMoviesByTitle(title: String) -> [Domain.Movie] {
        guard let movies = moviesMemoryCache[title] else {
            return []
        }

        return movies
    }
}
