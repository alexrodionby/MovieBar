//
//  QueryParameters.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 25.12.23.
//

/*
 https://api.kinopoisk.dev/v1.4/list?
 page=1
 &limit=10
 &selectFields=name&selectFields=category&selectFields=slug&selectFields=moviesCount&selectFields=cover
 &notNullFields=name&notNullFields=category&notNullFields=slug&notNullFields=moviesCount&notNullFields=cover.url&notNullFields=cover.previewUrl
 */

import Foundation

struct QueryParameters {
    
    // MARK: - Genres arrays
    
    static let genres = [
        ["все", "all"],
        ["аниме", "anime"],
        ["биография", "biografiya"],
        ["боевик", "boevik"],
        ["вестерн", "vestern"],
        ["военный", "voennyy"],
        ["детектив", "detektiv"],
        ["детский", "detskiy"],
        ["для взрослых", "dlya-vzroslyh"],
        ["документальный", "dokumentalnyy"],
        ["драма", "drama"],
        ["игра", "igra"],
        ["история", "istoriya"],
        ["комедия", "komediya"],
        ["концерт", "koncert"],
        ["короткометражка", "korotkometrazhka"],
        ["криминал", "kriminal"],
        ["мелодрама", "melodrama"],
        ["музыка", "muzyka"],
        ["мультфильм", "multfilm"],
        ["мюзикл", "myuzikl"],
        ["новости", "novosti"],
        ["приключения", "priklyucheniya"],
        ["реальное ТВ", "realnoe-TV"],
        ["семейный", "semeynyy"],
        ["спорт", "sport"],
        ["ток-шоу", "tok-shou"],
        ["триллер", "triller"],
        ["ужасы", "uzhasy"],
        ["фантастика", "fantastika"],
        ["фильм-нуар", "film-nuar"],
        ["фэнтези", "fentezi"],
        ["церемония", "ceremoniya"]
    ]
    
    static let categoryForQuery = [
        "аниме", "биография", "боевик", "вестерн", "военный", "детектив",
        "детский", "для взрослых", "документальный", "драма", "игра", "история",
        "комедия", "концерт", "короткометражка", "криминал", "мелодрама", "музыка",
        "мультфильм", "мюзикл", "новости", "приключения", "реальное ТВ", "семейный",
        "спорт", "ток-шоу", "триллер", "ужасы", "фантастика", "фильм-нуар", "фэнтези", "церемония"
    ]
    
    static let categoryEN = [
        "All", "Anime", "Biografiya", "Boevik", "Vestern", "Voennyy", "Detektiv",
        "Detskiy", "Dlya-vzroslyh", "Dokumentalnyy", "Drama", "Igra", "Istoriya",
        "Komediya", "Koncert", "Korotkometrazhka", "Kriminal", "Melodrama", "Muzyka",
        "Multfilm", "Myuzikl", "Novosti", "Priklyucheniya", "Realnoe-TV", "Semeynyy",
        "Sport", "Tok-shou", "Triller", "Uzhasy", "Fantastika", "Film-nuar", "Fentezi", "Ceremoniya"
    ]
    
    static let categoryRU = ["Все", "Аниме", "Биография", "Боевик", "Вестерн", "Военный", "Детектив", "Детский", "Для взрослых", "Документальный", "Драма", "Игра", "История", "Комедия", "Концерт", "Короткометражка", "Криминал", "Мелодрама", "Музыка", "Мультфильм", "Мюзикл", "Новости", "Приключения", "Реальное ТВ", "Семейный", "Спорт", "Ток-шоу", "Триллер", "Ужасы", "Фантастика", "Фильм-нуар", "Фэнтези", "Церемония"]
    
    static var category: [String] = .init()

// MARK: - Query arrays
    
    /// Для запроса коллекций фильмов на главном экране
    static let getMovieCollections: [String: Any] = [
        "page": 1,
        "limit": 20,
        "selectFields": ["name", "category", "slug", "moviesCount", "cover"],
        "notNullFields": ["name", "category", "slug", "moviesCount", "cover.url"]
    ]
    
    /// Для запроса списка филмов по категории
    static let getMovieByCategory: [String: Any] = [
        "page": 1,
        "limit": 20,
        "selectFields": ["id", "name", "enName", "rating", "genres", "poster", "description", "year", "ageRating", "type", "movieLength"],
        "notNullFields": ["id", "name", "enName", "rating.kp", "genres.name", "poster.url"]
    ]
    
    /// Для запроса списка популярных филмов
    static let getPopularMovie: [String: Any] = [
        "page": 1,
        "limit": 20,
        "selectFields": ["id", "name", "enName", "rating", "genres", "poster", "description", "year", "ageRating", "type", "movieLength"],
        "notNullFields": ["id", "name", "enName", "rating.kp", "genres.name", "poster.url"],
        "rating.kp": "8.5-10"
    ]
    
    /// Для поиска филмов по названию
    static let searchMovieByName: [String: Any] = [
        "page": 1,
        "limit": 20
    ]
    
    /// Для запроса списка фильмов по коллекции
    static let getMovieByCollection: [String: Any] = [
        "page": 1,
        "limit": 20,
        "selectFields": ["id", "name", "enName", "rating", "genres", "poster", "description", "year", "ageRating", "type", "movieLength"],
        "notNullFields": ["id", "name", "enName", "rating.kp", "genres.name", "poster.url"]
    ]
    
    /// Для запроса списка снимающихся фильмов
    static let getFilmingMovie: [String: Any] = [
        "page": 1,
        "limit": 20,
        "selectFields": ["id", "name", "enName", "rating", "genres", "poster", "description", "year", "ageRating", "type", "movieLength"],
        "notNullFields": ["id", "name", "enName", "rating.kp", "genres.name", "poster.url"]
    ]
    
}
