//
//  PostCellViewModel.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 18.11.2025.
//

import Foundation

protocol PostCellViewModelProtocol {
    var postTitle: String { get }
    var postBody: String { get }
    var userAvatar: String { get }
    var isFavorite: Box<Bool> { get }
    init(post: Post)
    func favoriteButtonPressed()
}

class PostCellViewModel: PostCellViewModelProtocol {
    var postTitle: String {
        post.title
    }
    
    var postBody: String {
        post.body
    }
    
    var userAvatar: String {
        return "user\(post.userId)"
    }
    
    var isFavorite: Box<Bool>
    private var post: Post
    
    required init(post: Post) {
        self.post = post
        isFavorite = Box(StorageManager.shared.getFavoriteStatus(for: post))
    }
    
    func favoriteButtonPressed() {
        isFavorite.value.toggle()
        StorageManager.shared.setFavoriteStatus(for: post, with: isFavorite.value)
    }
}
