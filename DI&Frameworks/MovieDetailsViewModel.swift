//
//  MovieDetailsViewModel.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 16/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain

protocol MovieDetailsViewModelType {
    var movie: Movie { get }
}

struct MovieDetailsViewModel: MovieDetailsViewModelType {
    let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }
}
