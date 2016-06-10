//
//  SearchMovieWireframe.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 16/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain

protocol SearchMovieWireframeType {
    func presentMovieDetails(movie: Movie, sourceViewController: UIViewController)
}

struct SearchMovieWireframe: SearchMovieWireframeType {
    
    private let dependenciesContainer: DependenciesContainer
    
    init(dependenciesContainer: DependenciesContainer = DependenciesContainer()) {
        self.dependenciesContainer = dependenciesContainer
    }
    
    func presentMovieDetails(movie: Movie, sourceViewController: UIViewController) {
        let viewModel = dependenciesContainer.resolve(MovieDetailsViewModelType.self, argument: movie)
        let viewController = dependenciesContainer.resolve(MovieDetailsViewController.self, argument: viewModel)

        sourceViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}
