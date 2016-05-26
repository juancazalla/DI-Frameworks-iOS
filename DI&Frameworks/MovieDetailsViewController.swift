//
//  MovieDetailsViewController.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 5/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    let viewModel: MovieDetailsViewModelType

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: MovieDetailsViewModelType) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        self.title = viewModel.movie.title
    }
}
