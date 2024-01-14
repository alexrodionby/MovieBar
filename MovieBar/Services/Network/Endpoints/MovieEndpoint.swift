//
//  MovieEndpoint.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 20.12.23.
//

import Foundation

enum MovieEndpoint {
    case fetchMovieCollections([String: Any]?)
    case fetchMovieByCategory([String: Any]?)
    case searchByMovieName([String: Any]?)
    case fetchMovieByCollection([String: Any]?)
}

extension MovieEndpoint: APIEndpoint {
    var scheme: String {
        switch self {
        default:
            return Constants.scheme
        }
    }
    
    var host: String {
        switch self {
        default:
            return Constants.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .fetchMovieCollections:
            return "/v1.4/list"
        case .fetchMovieByCategory:
            return "/v1.4/movie"
        case .searchByMovieName:
            return "/v1.4/movie/search"
        case .fetchMovieByCollection:
            return "/v1.4/movie"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .fetchMovieCollections(let parameters):
            return parameters
        case .fetchMovieByCategory(let parameters):
            return parameters
        case .searchByMovieName(let parameters):
            return parameters
        case .fetchMovieByCollection(let parameters):
            return parameters
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var body: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var contentType: ContentType? {
        switch self {
        default:
            return .json
        }
    }
    
    var acceptType: ContentType? {
        switch self {
        default:
            return .json
        }
    }
}
