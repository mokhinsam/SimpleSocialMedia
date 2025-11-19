//
//  NetworkManager.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 19.11.2025.
//

import Foundation
import Alamofire

enum Link: String {
    case postsURL = "https://jsonplaceholder.typicode.com/posts"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPosts(from url: String, completion: @escaping (Result<[Post], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: [Post].self) { response in
                switch response.result {
                case .success(let posts):
                    print(posts)
                    completion(.success(posts))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
