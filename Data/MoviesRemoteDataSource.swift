//
//  MoviesRemoteDataSource.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 17/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain
import BrightFutures
import SwiftyJSON

public protocol MoviesRemoteDataSourceType {
    func getMoviesByTitle(_ title: String) -> Future<[Domain.Movie], GetMoviesError>
}

public struct TMDBDataSource: MoviesRemoteDataSourceType {

    fileprivate let network: Networking

    public init(network: Networking) {
        self.network = network
    }

    public func getMoviesByTitle(_ title: String) -> Future<[Domain.Movie], GetMoviesError> {
        let url = "https://api.themoviedb.org/3/search/movie"
        let parameters = ["api_key": Keys.TMDBApiKey, "query": title]

        let moviesPromise = Promise<[Domain.Movie], GetMoviesError>()
        network.request(.GET, url, parameters: parameters)
            .onSuccess { data in
                let movies = TMDBDataSource.decode(data)
                moviesPromise.success(movies)
            }.onFailure { _ in
                moviesPromise.failure(.unknownError)
        }

        return moviesPromise.future
    }

    fileprivate static func decode(_ data: Data) -> [Domain.Movie] {
        let json = JSON(data: data)
        var movies: [Domain.Movie] = []
        for (_, j) in json["results"] {
            if let title = j["title"].string {
                let movie = Movie(title: title)
                movies.append(movie)
            }
        }

        return movies
    }
}
