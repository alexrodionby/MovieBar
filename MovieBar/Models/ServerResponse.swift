//
//  ServerResponse.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//

import Foundation

// MARK: - Структура для ответа от сервера

struct ServerResponse: Decodable {
    let statusCode: Int
    let message: String
    let error: String
}
