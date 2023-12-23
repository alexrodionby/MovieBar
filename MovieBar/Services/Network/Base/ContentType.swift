//
//  ContentType.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//
/*
 json: Представляет формат JSON. Возвращаемое значение headerValue: "application/json".
 formURLEncoded: Представляет данные, закодированные в формате x-www-form-urlencoded. Возвращаемое значение headerValue: "application/x-www-form-urlencoded".
 multipartFormData: Представляет данные, отправляемые в формате multipart/form-data. Возвращаемое значение headerValue: "multipart/form-data".
 xml: Представляет данные в формате XML. Возвращаемое значение headerValue: "application/xml".
 plainText: Представляет обычный текст. Возвращаемое значение headerValue: "text/plain".
 custom(String): Данный кейс предоставляет гибкость для определения пользовательского типа контента. Вы можете указать собственный строковый формат типа контента. Возвращаемое значение headerValue: Значение, переданное при создании этого кейса.
 */

import Foundation

enum ContentType {
    case json
    case formURLEncoded
    case multipartFormData
    case xml
    case plainText
    case custom(String)
    
    var headerValue: String {
        switch self {
        case .json:
            return "application/json"
        case .formURLEncoded:
            return "application/x-www-form-urlencoded"
        case .multipartFormData:
            return "multipart/form-data"
        case .xml:
            return "application/xml"
        case .plainText:
            return "text/plain"
        case .custom(let value):
            return value
        }
    }
}

