//
//  APIError.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//
/*
 Определяет различные кейсы ошибок, которые могут возникнуть при взаимодействии с API (например, ошибки HTTP-статусов 400, 401 и т. д.).
 Кейс .unknown используется для представления всех остальных ошибок с указанием статус-кода и сообщения об ошибке.
 Статический метод from(response:data:) используется для создания экземпляра APIError на основе HTTP-ответа и данных об ошибке.
 Извлекает статус-код и данные из ответа и затем пытается распарсить JSON, чтобы получить сообщение об ошибке и тип ошибки.
 Возвращает соответствующий экземпляр APIError или nil, если данные не были получены или произошла ошибка при их обработке.
 */

import Foundation

enum APIError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case internalServerError
    case unknown(statusCode: Int, message: String)
    
    init(statusCode: Int, message: String, error: String) {
        switch statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 500:
            self = .internalServerError
        default:
            self = .unknown(statusCode: statusCode, message: message)
        }
    }
    
    static func from(response: HTTPURLResponse?, data: Data?) -> APIError? {
        guard let statusCode = response?.statusCode else {
            return .unknown(statusCode: -1, message: "No status code")
        }
        
        guard let data = data else {
            return .unknown(statusCode: statusCode, message: "No error data")
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            let message = json?["message"] as? String ?? "No error message"
            let error = json?["error"] as? String ?? "Unknown Error"
            
            return APIError(statusCode: statusCode, message: message, error: error)
        } catch {
            return .unknown(statusCode: statusCode, message: "Failed to parse error data")
        }
    }
}
