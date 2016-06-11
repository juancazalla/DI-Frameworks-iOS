//
//  SearchMovieUseCaseTests.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 11/6/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import XCTest
import Nimble
import Swinject
import Domain

@testable import DI_Frameworks
@testable import Data

class SearchMovieUseCaseTests: XCTestCase {

    func testSearchMovies() {
        let movies: [Domain.Movie] = [Movie(title: "Brácula (Condemor II)"),
                                      Movie(title: "Aquí llega Condemor, el pecador de la pradera")]
        givenAnEmptySearchViewController(futureSearchResults: movies)

        searchMoviesWithTitle("Condemor")

        for movie in movies {
            let movieCell = tester().waitForViewWithAccessibilityLabel(movie.title)
                as! MovieTableViewCell

            expect(movieCell.titleLabel.text).to(equal(movie.title))
        }
    }
}

private extension SearchMovieUseCaseTests {
    func givenAnEmptySearchViewController(futureSearchResults movies: [Domain.Movie]) {
        let dependenciesContainer = DependenciesContainer.sharedInstance
        dependenciesContainer.container.register(MoviesRemoteDataSourceType.self) { _ in
            MoviesRemoteDataSourceStub(movies: movies)
        }

        let searchViewController = dependenciesContainer.resolve(SearchViewController)
        UIApplication.sharedApplication().keyWindow?.rootViewController = UINavigationController(rootViewController: searchViewController)
    }
    
    func searchMoviesWithTitle(title: String) {
        tester().enterText(title, intoViewWithAccessibilityLabel: "SearchBar")
        
        tester().tapViewWithAccessibilityLabel("Search")
    }
}
