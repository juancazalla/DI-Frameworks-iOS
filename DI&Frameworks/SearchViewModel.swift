//
//  SearchViewModel.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 15/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain

protocol SearchViewModelType {
    var delegate: SearchViewModelDelegate? { get set }

    var movies: [Movie] { get }

    var searchText: String { get set }

    func search()
}

protocol SearchViewModelDelegate {
    func moviesDidUpdate()
}

class SearchViewModel: SearchViewModelType {
    let getMoviesByTitle: GetMoviesByTitleType
    weak var delegate: SearchViewModelDelegate?
    var movies: [Movie] = [] {
        didSet {
            delegate?.moviesDidUpdate()
        }
    }

    var searchText = "" {
        didSet {
            if movies.count > 0 {
                movies = []
            }
        }
    }

    init(getMoviesByTitle: GetMoviesByTitleType) {
        self.getMoviesByTitle = getMoviesByTitle
    }

    func search() {
        getMoviesByTitle.execute(searchText).onSuccess { movies in
            self.movies = movies
        }
    }
}
