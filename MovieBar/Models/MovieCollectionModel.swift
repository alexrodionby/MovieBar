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

// MARK: - Doc
struct MovieCollection: Codable {
    var category, name, slug, createdAt: String?
    var updatedAt, id: String?
    var moviesCount: Int?
    var cover: Cover?
}

// MARK: - Cover
struct Cover: Codable {
    var url, previewURL: String?

    enum CodingKeys: String, CodingKey {
        case url
        case previewURL = "previewUrl"
    }
}
