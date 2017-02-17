//
//  SearchMovieUseCaseTests.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 11/6/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import XCTest
import Nimble
import Domain

@testable import DI_Frameworks
@testable import Data

class SearchMovieUseCaseTests: XCTestCase {

    func testSearchMovies() {
        givenAnEmptySearchViewController()

        let movies = searchMoviesWithTitle("Condemor")

        for movie in movies {
            let movieCell = tester().waitForView(withAccessibilityLabel: movie.title)
                as! MovieTableViewCell

            expect(movieCell.titleLabel.text).to(equal(movie.title))
        }
    }
}

private extension SearchMovieUseCaseTests {
    func givenAnEmptySearchViewController() {
		let searchMoviesNavigator = SearchMoviesNavigator(assembler: TestAssembler())

		searchMoviesNavigator.navigateToSearchMovies(window: UIApplication.shared.keyWindow)
    }
    
    func searchMoviesWithTitle(_ title: String) -> [Domain.Movie] {
        tester().enterText(title, intoViewWithAccessibilityLabel: "SearchBar")
        
        tester().tapView(withAccessibilityLabel: "Search")
        
        return [Movie(title: "Brácula (Condemor II)"),
                Movie(title: "Aquí llega Condemor, el pecador de la pradera")]
    }
}

class TestAssembler: Assembler { }

extension SearchMoviesAssembler where Self: TestAssembler {
	func resolve() -> Networking {
		return NetworkStub(filename: "Condemor")
	}
}
