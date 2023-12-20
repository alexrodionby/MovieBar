//
//  HTTPClient.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//
/*
 HTTPClient представляет собой клиент для выполнения HTTP-запросов с использованием Combine в Swift. Этот класс управляет конфигурацией сеанса URLSession и предоставляет метод request, который принимает объект APIEndpoint и возвращает AnyPublisher с результатами запроса или ошибкой.
 Основные функции:
 Инициализация: Класс HTTPClient создает URLSession с использованием конфигурации по умолчанию.
 Метод request:
 Принимает объект APIEndpoint, который представляет собой конечную точку для HTTP-запроса.
 Строит URLRequest на основе параметров из APIEndpoint.
 Выполняет запрос с использованием dataTaskPublisher для получения данных и ответа.
 Проверяет статус кода ответа и декодирует данные с использованием JSONDecoder.
 Возвращает результат запроса в виде AnyPublisher, который может быть обработан с использованием Combine.
 Методы-помощники:
 buildURLRequest: Строит URLRequest на основе параметров из APIEndpoint, включая обработку параметров, заголовков и тела запроса.
 createQueryParameters: Преобразует параметры запроса из APIEndpoint в массив URLQueryItem.
 */

import Foundation
import Combine

class HTTPClient {
    
    // MARK: - Session configuration
    
    let configuration = URLSessionConfiguration.default
    let session: URLSession
    
    init() {
        session = URLSession(configuration: configuration)
    }
    
    // MARK: - Request
    
    func request<T: Codable>(endpoint: APIEndpoint) -> AnyPublisher<T, APIError> {
        
        // Попытка создания запроса на основе Endpoint
        guard let urlRequest = buildURLRequest(endpoint: endpoint) else {
            return Fail(error: APIError.unknown(statusCode: -1, message: "Failed to build URL request"))
                .eraseToAnyPublisher()
        }
        
        // Выполнение запроса и обработка результатов
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.unknown(statusCode: -1, message: "No HTTPURLResponse")
                }
                
                guard 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.from(response: httpResponse, data: data) ?? APIError.unknown(statusCode: httpResponse.statusCode, message: "Request failed with status code \(httpResponse.statusCode)")
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.unknown(statusCode: -1, message: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Helper methods
    
    private func buildURLRequest(endpoint: APIEndpoint) -> URLRequest? {
        
        var components = URLComponents()
        
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        
        components.queryItems = createQueryParameters(endpoint: endpoint)
        
        guard let url = components.url else {
            print("Ошибка: Невозможно создать URL из компонентов: \(components)")
            return nil
        }
        
        print("URL для запроса ===", url)
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        request.addValue(Constants.token, forHTTPHeaderField: "X-API-KEY")
        
        if let headers = endpoint.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let contentType = endpoint.contentType {
            request.addValue(contentType.headerValue, forHTTPHeaderField: "Content-Type")
        }
        
        if let acceptType = endpoint.acceptType {
            request.addValue(acceptType.headerValue, forHTTPHeaderField: "Accept")
        }
        
        if let body = endpoint.body {
            switch endpoint.contentType {
            case .json:
                request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            case .formURLEncoded:
                let bodyString = body.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
                request.httpBody = bodyString.data(using: .utf8)
            case .multipartFormData:
                // Обработка multipart/form-data требует более сложной логики,
                // так как вам, возможно, потребуется отправлять файлы или изображения.
                break
            default:
                break
            }
        }
        
        return request
    }
    
    
    private func createQueryParameters(endpoint: APIEndpoint) -> [URLQueryItem] {
        
        var queryItems = [URLQueryItem].init()
        
        guard let parameters = endpoint.parameters else {
            return queryItems
        }
        
        for (key, value) in parameters {
            switch value {
            case let stringValue as String where !stringValue.isEmpty:
                queryItems.append(URLQueryItem(name: key, value: stringValue))
                
            case let intValue as Int:
                queryItems.append(URLQueryItem(name: key, value: String(intValue)))
                
            case let stringArrayValue as [String]:
                for item in stringArrayValue {
                    queryItems.append(URLQueryItem(name: key, value: item))
                }
                
            case let boolValue as Bool:
                queryItems.append(URLQueryItem(name: key, value: String(boolValue)))
                
            default:
                continue
            }
        }
        
        return queryItems
    }
}
