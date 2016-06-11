//
//  SearchViewController.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 3/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(MovieTableViewCell)
            tableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }

    private let searchBar: UISearchBar
    private var viewModel: SearchViewModelType
    private let wireframe: SearchMovieWireframeType

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: SearchViewModelType, wireframe: SearchMovieWireframeType) {
        searchBar = UISearchBar()
        searchBar.searchBarStyle = .Minimal
        searchBar.accessibilityLabel = "SearchBar"
        self.viewModel = viewModel
        self.wireframe = wireframe

        super.init(nibName: nil, bundle: nil)

        self.viewModel.delegate = self
        searchBar.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = searchBar
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func moviesDidUpdate() {
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configureWithMovie(viewModel.movies[indexPath.row])
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        wireframe.presentMovieDetails(viewModel.movies[indexPath.row], sourceViewController: self)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.search()
    }
}
