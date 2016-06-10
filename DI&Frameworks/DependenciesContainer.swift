//
//  DependenciesContainer.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 5/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Swinject
import Domain
import Data

struct DependenciesContainer {
    static let container = Container()
    
    func registerDependencies() {
        DependenciesContainer.container.register(GetMoviesByTitleType.self) { _ in
            GetMoviesByTitle(moviesRepository: self.resolve(MoviesRepositoryType))
        }
        DependenciesContainer.container.register(SearchViewModelType.self) { _ in
            SearchViewModel(getMoviesByTitle: self.resolve(GetMoviesByTitleType))
        }
        DependenciesContainer.container.register(SearchViewController.self) { _ in
            SearchViewController(viewModel: self.resolve(SearchViewModelType), wireframe: self.resolve(SearchMovieWireframeType))
        }
        DependenciesContainer.container.register(SearchMovieWireframeType.self) { _ in
            SearchMovieWireframe()
        }
        DependenciesContainer.container.register(MovieDetailsViewController.self) { _, viewModel in
            MovieDetailsViewController(viewModel: viewModel)
        }
        DependenciesContainer.container.register(MovieDetailsViewModelType.self) { _, movie in
            MovieDetailsViewModel(movie: movie)
        }
        DependenciesContainer.container.register(MoviesRepositoryType.self) { _ in
            MoviesRepository(remoteDataSource: self.resolve(MoviesRemoteDataSourceType),
                             cacheDataSource: self.resolve(MoviesCacheDataSourceType))
        }
        DependenciesContainer.container.register(MoviesRemoteDataSourceType.self) { _ in
            TMDBDataSource(network: self.resolve(Networking))
        }
        DependenciesContainer.container.register(MoviesCacheDataSourceType.self) { _ in
            MoviesCacheDataSource()
        }
        DependenciesContainer.container.register(Networking.self) { _ in
            Network()
        }
    }

    func resolve<Service> (serviceType: Service.Type) -> Service {
        guard let service = DependenciesContainer.container.resolve(serviceType) else {
            fatalError("Can not resolve: \(String(Service))")
        }
        return service
    }
    
    func resolve<Service, Arg1>(serviceType: Service.Type, argument: Arg1) -> Service {
        guard let service = DependenciesContainer.container.resolve(serviceType, argument: argument) else {
            fatalError("Can not resolve: \(String(Service))")
        }
        return service
    }
}
