//
//  TheMovieDBMoviesDataSource.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 17/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain
import BrightFutures
import Alamofire
import SwiftyJSON

public struct TMDBDataSource: MoviesRepository {

    let network: Networking

    public init(network: Networking) {
        self.network = network
    }

    public func getMoviesByTitle(title: String) -> Future<[Domain.Movie], GetMoviesError> {
        let moviesPromise = Promise<[Domain.Movie], GetMoviesError>()

        let url = "https://api.themoviedb.org/3/search/movie"
        // let apiKey = "YOUR API KEY"
        let parameters = ["api_key": apiKey, "query": title]

        network.request(.GET, url, parameters: parameters).response {
            _, _, data, error in
            guard error == nil else {
                moviesPromise.failure(.UnknownError)
                return
            }

            let movies = data.map { TMDBDataSource.decode($0) }
            if let movies = movies {
                moviesPromise.success(movies)
            } else {
                moviesPromise.failure(.UnknownError)
            }
        }

        return moviesPromise.future
    }

    private static func decode(data: NSData) -> [Domain.Movie] {
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
