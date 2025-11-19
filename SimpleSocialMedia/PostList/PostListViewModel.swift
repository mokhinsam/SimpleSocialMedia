//
//  PostListViewModel.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 18.11.2025.
//

import Foundation

protocol PostListViewModelProtocol {
    var cellReuseIdentifier: String { get }
}

class PostListViewModel: PostListViewModelProtocol {
    var cellReuseIdentifier: String {
        String(describing: PostCell.self)
    }
}
