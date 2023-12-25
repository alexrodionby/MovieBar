//
//  MovieEndpoint.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 20.12.23.
//

import Foundation

enum MovieEndpoint {
    case fetchMovieCollections([String: Any]?)
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
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMovieCollections:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .fetchMovieCollections(let parameters):
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
        case .fetchMovieCollections:
            return .json
        }
    }
    
    var acceptType: ContentType? {
        switch self {
        case .fetchMovieCollections:
            return .json
        }
    }
    
    
    
    
}
