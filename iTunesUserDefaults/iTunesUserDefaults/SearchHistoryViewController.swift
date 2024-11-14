//
//  SearchHistoryViewController.swift
//  iTunesUserDefaults
//
//  Created by Ибрагим Габибли on 14.11.2024.
//

import UIKit

class SearchHistoryViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    private let id = "cell"
    var searchHistory = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    private func setupNavigationBar() {
        title = "Search History"
    }

    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = .systemGray6

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SearchHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.textLabel?.text = searchHistory[indexPath.row]
        return cell
    }
}

extension SearchHistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedTerm = searchHistory[indexPath.row]
        performSearch(for: selectedTerm)
    }

    func performSearch(for term: String) {
        let searchViewController = SearchViewController()
        searchViewController.searchAlbums(with: term)
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}

