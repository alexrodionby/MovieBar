//
//  MovieListModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 20.12.23.
//

import Foundation

// MARK: - MovieListModel
struct MovieListModel: Codable {
    var docs: [Doc]?
    var total, limit, page, pages: Int?
}

// MARK: - Doc
struct Doc: Codable {
    var name: String?
    var moviesCount: Int?
    var cover: Cover?
    var id: String?
}

// MARK: - Cover
struct Cover: Codable {
    var url, previewURL: String?

    enum CodingKeys: String, CodingKey {
        case url
        case previewURL = "previewUrl"
    }
}
