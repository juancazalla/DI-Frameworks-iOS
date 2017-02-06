//
//  DependenciesContainer.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 5/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Dip
import Domain
import Data

struct DependenciesContainer {

    static let sharedInstance = DependenciesContainer()

    var container: DependencyContainer = DependencyContainer()

    func registerDependencies() {
        container.register {
            GetMoviesByTitle(moviesRepository: self.resolve()) as GetMoviesByTitleType
        }
        container.register {
            SearchViewModel(getMoviesByTitle: self.resolve()) as SearchViewModelType
        }
        container.register {
            SearchViewController(viewModel: self.resolve(),
                                 wireframe: self.resolve())
        }
        container.register() {
            SearchMovieWireframe() as SearchMovieWireframeType
        }
        container.register() { viewModel in
            MovieDetailsViewController(viewModel: viewModel)
        }
        container.register() { movie in
            MovieDetailsViewModel(movie: movie) as MovieDetailsViewModelType
        }
        container.register() {
            MoviesRepository(remoteDataSource: self.resolve(),
                             cacheDataSource: self.resolve()) as MoviesRepositoryType
        }
        container.register {
            TMDBDataSource(network: self.resolve()) as MoviesRemoteDataSourceType
        }
        container.register {
            MoviesCacheDataSource() as MoviesCacheDataSourceType
        }
        container.register {
            Network() as Networking
        }
    }
}

extension DependenciesContainer {
    func resolve<T>(tag: DependencyTagConvertible? = nil) -> T {
        guard let resolvedInstance = try? container.resolve() as T else {
            fatalError("Can not resolve: \(String(describing: T.self))")
        }
        
        return resolvedInstance
    }
    
    func resolve<T, A>(withArguments arg1: A) -> T {
        guard let resolvedInstance = try? (container.resolve(A.self) as! T) else {
            fatalError("Can not resolve: \(String(describing: T.self))")
        }
        
        return resolvedInstance
    }
}
