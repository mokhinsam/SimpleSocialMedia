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
    init(post: Post)
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
    
    private var post: Post
    
    required init(post: Post) {
        self.post = post
    }
}
