//
//  HTTPMethod.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 19.12.23.
//
/*
 GET: Используется для запроса данных из указанного ресурса. GET-запросы должны только извлекать данные и не должны иметь других побочных эффектов на сервере.
 POST: Используется для отправки данных к серверу для создания нового ресурса. Часто используется при отправке данных формы или при загрузке файла.
 PUT: Используется для обновления существующего ресурса или создания нового, если ресурс не существует. Весь ресурс заменяется данными, предоставленными в теле запроса.
 PATCH: Аналогичен PUT, но используется для частичного обновления ресурса, т.е. изменения только тех данных, которые предоставлены в теле запроса.
 DELETE: Используется для удаления указанного ресурса на сервере.
 HEAD: Аналогичен GET, но сервер не возвращает тело ответа, используется для получения заголовков ответа без тела.
 OPTIONS: Используется для описания параметров связанных с ресурсом, либо для запроса информации о возможностях методов, поддерживаемых сервером.
 TRACE: Используется для проверки маршрутизации запроса к серверу. Этот метод позволяет серверу вернуть полученный запрос, что может быть полезно для диагностики.
 CONNECT: Используется для установки туннеля к серверу, указанному в запросе, для дальнейших обменов данными.
 */

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}
