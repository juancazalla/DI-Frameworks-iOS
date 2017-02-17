//
//  SearchMoviesNavigator.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 6/2/17.
//  Copyright © 2017 Juan Cazalla Estrella. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol SearchMoviesNavigatorType {
	func navigateToSearchMovies(window: UIWindow?)
}

struct SearchMoviesNavigator: SearchMoviesNavigatorType {

	private let assembler: Assembler

	init(assembler: Assembler) {
		self.assembler = assembler
	}

	func navigateToSearchMovies(window: UIWindow?) {
		let searchViewController: SearchViewController = assembler.resolve()
		let navigationController = UINavigationController(rootViewController: searchViewController)
		window?.rootViewController = navigationController
	}
}
