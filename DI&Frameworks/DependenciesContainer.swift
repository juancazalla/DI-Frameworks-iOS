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
    private static let container = Container()
    
    static func registerDependencies() {
        container.register(GetMoviesByTitleType.self) { _ in
            GetMoviesByTitle(moviesRepository: self.resolve(MoviesRepository))
        }
        container.register(SearchViewModelType.self) { _ in
            SearchViewModel(getMoviesByTitle: self.resolve(GetMoviesByTitleType))
        }
        container.register(SearchViewController.self) { _ in
            SearchViewController(viewModel: self.resolve(SearchViewModelType), wireframe: self.resolve(SearchMovieWireframeType))
        }
        container.register(SearchMovieWireframeType.self) { _ in
            SearchMovieWireframe()
        }
        container.register(MovieDetailsViewController.self) { _, viewModel in
            MovieDetailsViewController(viewModel: viewModel)
        }
        container.register(MovieDetailsViewModelType.self) { _, movie in
            MovieDetailsViewModel(movie: movie)
        }
        container.register(MoviesRepository.self) { _ in
            TMDBDataSource(network: self.resolve(Networking))
        }
        container.register(Networking.self) { _ in
            Network()
        }
    }

    static func resolve<Service> (serviceType: Service.Type) -> Service {
        guard let service = container.resolve(serviceType) else {
            fatalError("Can not resolve: \(String(Service))")
        }
        return service
    }
    
    static func resolve<Service, Arg1>(serviceType: Service.Type, argument: Arg1) -> Service {
        guard let service = container.resolve(serviceType, argument: argument) else {
            fatalError("Can not resolve: \(String(Service))")
        }
        return service
    }
}
