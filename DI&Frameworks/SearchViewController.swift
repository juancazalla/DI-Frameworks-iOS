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
            tableView.register(MovieTableViewCell.self)
            tableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }

    fileprivate let searchBar: UISearchBar
    fileprivate var viewModel: SearchViewModelType
    fileprivate let navigator: MovieDetailsNavigatorType

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: SearchViewModelType, navigator: MovieDetailsNavigatorType) {
        searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.accessibilityLabel = "SearchBar"
        self.viewModel = viewModel
        self.navigator = navigator

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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let _ = cell.configureWithMovie(viewModel.movies[indexPath.row])
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

		navigator.navigateTo(movie: viewModel.movies[indexPath.row], sourceViewController: self)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.search()
    }
}
