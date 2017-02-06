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
    func presentMovieDetails(_ movie: Movie, sourceViewController: UIViewController)
}

struct SearchMovieWireframe: SearchMovieWireframeType {
    
    fileprivate let dependenciesContainer: DependenciesContainer
    
    init(dependenciesContainer: DependenciesContainer = DependenciesContainer.sharedInstance) {
        self.dependenciesContainer = dependenciesContainer
    }
    
    func presentMovieDetails(_ movie: Movie, sourceViewController: UIViewController) {
        let viewModel: MovieDetailsViewModelType = dependenciesContainer.resolve(withArguments: movie)
        let viewController: MovieDetailsViewController = dependenciesContainer.resolve(withArguments: viewModel)

        sourceViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}
