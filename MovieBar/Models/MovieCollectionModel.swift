//
//  MovieCollectionModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 20.12.23.
//

import Foundation

// MARK: - MovieCollectionModel
struct MovieCollectionModel: Codable {
    var docs: [MovieCollection]?
    var total, limit, page, pages: Int?
}

// MARK: - MovieCollection
struct MovieCollection: Codable {
    var category: Category?
    var name, slug: String?
    var moviesCount: Int?
    var cover: Cover?
    var id: String?
}

enum Category: String, Codable {
    case премии = "Премии"
    case сериалы = "Сериалы"
    case фильмы = "Фильмы"
}

// MARK: - Cover
struct Cover: Codable {
    var url, previewURL: String?

    enum CodingKeys: String, CodingKey {
        case url
        case previewURL = "previewUrl"
    }
}
