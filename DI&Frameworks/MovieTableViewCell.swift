//
//  MovieTableViewCell.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 16/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import UIKit
import Domain

class MovieTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var titleLabel: UILabel!

    func configureWithMovie(movie: Movie) -> MovieTableViewCell {
        titleLabel.text = movie.title

        return self
    }
}
