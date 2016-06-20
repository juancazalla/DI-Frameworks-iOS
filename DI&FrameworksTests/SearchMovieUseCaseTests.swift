//
//  SearchMovieUseCaseTests.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 11/6/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import XCTest
import Nimble
import Dip
import Domain

@testable import DI_Frameworks
@testable import Data

class SearchMovieUseCaseTests: XCTestCase {

    func testSearchMovies() {
        givenAnEmptySearchViewController()

        let movies = searchMoviesWithTitle("Condemor")

        for movie in movies {
            let movieCell = tester().waitForViewWithAccessibilityLabel(movie.title)
                as! MovieTableViewCell

            expect(movieCell.titleLabel.text).to(equal(movie.title))
        }
    }
}

private extension SearchMovieUseCaseTests {
    func givenAnEmptySearchViewController() {
        let dependenciesContainer = DependenciesContainer.sharedInstance
        dependenciesContainer.container.register {
            NetworkStub(filename: "Condemor") as Networking
        }

        let searchViewController: SearchViewController = dependenciesContainer.resolve()
        UIApplication.sharedApplication().keyWindow?.rootViewController = UINavigationController(rootViewController: searchViewController)
    }
    
    func searchMoviesWithTitle(title: String) -> [Domain.Movie] {
        tester().enterText(title, intoViewWithAccessibilityLabel: "SearchBar")
        
        tester().tapViewWithAccessibilityLabel("Search")
        
        return [Movie(title: "Brácula (Condemor II)"),
                Movie(title: "Aquí llega Condemor, el pecador de la pradera")]
    }
}
