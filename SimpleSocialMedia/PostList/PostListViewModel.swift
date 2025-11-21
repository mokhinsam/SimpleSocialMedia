//
//  PostListViewModel.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 18.11.2025.
//

import Foundation

protocol PostListViewModelProtocol {
    var cellReuseIdentifier: String { get }
    var numberOfRows: Int { get }
    func fetchPosts(completion: @escaping () -> Void)
    func getPostCellViewModel(at row: Int) -> PostCellViewModelProtocol
}

class PostListViewModel: PostListViewModelProtocol {
    var cellReuseIdentifier: String {
        String(describing: PostCell.self)
    }
    
    var numberOfRows: Int {
        posts.count
    }
    
    private var posts: [Post] = []
    
    func fetchPosts(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchPosts(from: Link.postsURL.rawValue) { [weak self] result in
            switch result {
            case .success(let posts):
                self?.savePostsToStorage(posts)
                self?.posts = posts
                completion()
            case .failure(let error):
                print("Network error: \(error)")
                self?.loadPostsFromStorage()
                completion()
            }
        }
    }
    
    func getPostCellViewModel(at row: Int) -> PostCellViewModelProtocol {
        PostCellViewModel(post: posts[row])
    }
}

//MARK: - Private Methods
extension PostListViewModel {
    private func savePostsToStorage(_ posts: [Post]) {
        StorageManager.shared.save(posts)
    }
    
    private func loadPostsFromStorage() {
        StorageManager.shared.fetchPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
            case .failure(let error):
                print("Storage error: \(error)")
            }
        }
    }
}
