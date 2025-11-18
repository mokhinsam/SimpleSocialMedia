//
//  PostListViewController.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 17.11.2025.
//

import UIKit

class PostListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

//MARK: - Private Methods
extension PostListViewController {
    private func setupNavigationBar() {
        title = "Posts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}

