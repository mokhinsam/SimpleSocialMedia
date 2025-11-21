//
//  Post.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 19.11.2025.
//

struct Post: @nonisolated Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var isFavorite = false
}
