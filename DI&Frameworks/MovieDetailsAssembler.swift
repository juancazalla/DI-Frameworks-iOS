//
//  MovieDetailsAssembler.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 6/2/17.
//  Copyright © 2017 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain

protocol MovieDetailsAssembler {
	func resolve(movie: Movie) -> MovieDetailsViewController

	func resolve(movie: Movie) -> MovieDetailsViewModelType
}

extension MovieDetailsAssembler {
	func resolve(movie: Movie) -> MovieDetailsViewController {
		return MovieDetailsViewController(viewModel: resolve(movie: movie))
	}

	func resolve(movie: Movie) -> MovieDetailsViewModelType {
		return MovieDetailsViewModel(movie: movie)
	}
}
