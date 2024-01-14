//
//  APIEndpoint.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//
/*
 scheme: Определяет протокол, который будет использоваться при создании URL. Например, "https" или "http".
 host: Указывает хост, к которому будет отправлен запрос, например, "api.example.com".
 path: Определяет конкретный путь эндпоинта на сервере. Например, "/users" или "/products/123".
 method: Определяет HTTP-метод, который будет использоваться для запроса (GET, POST, PUT и т.д.).
 parameters: Содержит параметры запроса. Это могут быть параметры URL для GET-запросов или параметры тела запроса для POST-запросов.
 headers: Определяет дополнительные заголовки HTTP-запроса, которые могут быть необходимы для конкретного эндпоинта.
 body: Содержит данные тела запроса, которые могут быть отправлены на сервер. Это может быть полезно для методов POST, PUT и др.
 contentType: Задает тип контента, который будет использоваться в заголовке "Content-Type" HTTP-запроса.
 acceptType: Задает тип контента, который будет использоваться в заголовке "Accept" HTTP-запроса.
 */

import Foundation

protocol APIEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var body: [String: Any]? { get }
    var contentType: ContentType? { get }
    var acceptType: ContentType? { get }
}
