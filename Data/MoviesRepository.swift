//
//  MoviesRepository.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 27/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain
import BrightFutures

public struct MoviesRepository: Domain.MoviesRepositoryType {
    fileprivate let remoteDataSource: MoviesRemoteDataSourceType
    fileprivate let cacheDataSource: MoviesCacheDataSourceType

    public init(remoteDataSource: MoviesRemoteDataSourceType, cacheDataSource: MoviesCacheDataSourceType) {
        self.remoteDataSource = remoteDataSource
        self.cacheDataSource = cacheDataSource
    }

    public func getMoviesByTitle(_ title: String) -> Future<[Domain.Movie], GetMoviesError> {
        guard !cacheDataSource.containsMoviesWithTitle(title) else {
            let promise = Promise<[Domain.Movie], GetMoviesError>()
            promise.success(cacheDataSource.getMoviesByTitle(title))
            return promise.future
        }

        return remoteDataSource.getMoviesByTitle(title)
    }
}
