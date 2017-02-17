//
//  SearchMoviesAssembler.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 6/2/17.
//  Copyright © 2017 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain
import Data

protocol SearchMoviesAssembler {
	func resolve() -> SearchViewController

	func resolve() -> SearchViewModelType

	func resolve() -> MovieDetailsNavigatorType

	func resolve() -> GetMoviesByTitleType

	func resolve() -> MoviesRepositoryType

	func resolve() -> MoviesRemoteDataSourceType

	func resolve() -> MoviesCacheDataSourceType

	func resolve() -> Networking
}

extension SearchMoviesAssembler where Self: Assembler {
	func resolve() -> SearchViewController {
		return SearchViewController(viewModel: resolve(), navigator: resolve())
	}

	func resolve() -> SearchViewModelType {
		return SearchViewModel(getMoviesByTitle: resolve())
	}

	func resolve() -> MovieDetailsNavigatorType {
		return MovieDetailsNavigator(assembler: self)
	}

	func resolve() -> GetMoviesByTitleType {
		return GetMoviesByTitle(moviesRepository: resolve())
	}

	func resolve() -> MoviesRepositoryType {
		return MoviesRepository(remoteDataSource: resolve(), cacheDataSource: resolve())
	}

	func resolve() -> MoviesRemoteDataSourceType {
		return TMDBDataSource(network: resolve())
	}

	func resolve() -> MoviesCacheDataSourceType {
		return MoviesCacheDataSource()
	}

	func resolve() -> Networking {
		return Network()
	}
}
