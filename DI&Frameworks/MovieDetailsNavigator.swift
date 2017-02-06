//
//  MovieDetailsNavigator.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 16/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import Domain

protocol MovieDetailsNavigatorType {
    func navigateTo(movie: Movie, sourceViewController: UIViewController)
}

struct MovieDetailsNavigator: MovieDetailsNavigatorType {
    
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func navigateTo(movie: Movie, sourceViewController: UIViewController) {
        let viewController: MovieDetailsViewController = assembler.resolve(movie: movie)

        sourceViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}
