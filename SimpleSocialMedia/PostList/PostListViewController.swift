//
//  PostListViewController.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 17.11.2025.
//

import UIKit

class PostListViewController: UITableViewController {
    
    private var viewModel: PostListViewModelProtocol! {
        didSet {
            viewModel.fetchCourses { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PostListViewModel()
        setupNavigationBar()
        setupTableView()
    }
}

//MARK: - Private Methods
extension PostListViewController {
    private func setupNavigationBar() {
        title = "Posts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setupTableView() {
        tableView.register(PostCell.self, forCellReuseIdentifier: viewModel.cellReuseIdentifier)
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
    }
}

//MARK: - UITableViewDataSource
extension PostListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellReuseIdentifier, for: indexPath)
        guard let cell = cell as? PostCell else { return UITableViewCell() }
        cell.viewModel = viewModel.getPostCellViewModel(at: indexPath.row)
        return cell
    }
}
