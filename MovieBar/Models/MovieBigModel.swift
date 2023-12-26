//
//  MovieBigModel.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 26.12.23.
//

import Foundation

// MARK: - MovieBigModel
struct MovieBigModel: Codable {
    var docs: [MovieDetail]?
    var total, limit, page, pages: Int?
}

// MARK: - Doc
struct MovieDetail: Codable {
    var fees: Fees?
    var externalID: ExternalID?
    var rating, votes: Rating?
    var backdrop: Backdrop?
    var movieLength, id: Int?
    var type: SequelsAndPrequelType?
    var name, description: String?
    var premiere: Premiere?
    var slogan: String?
    var year: Int?
    var budget: Budget?
    var poster: Backdrop?
    var facts: [Fact]?
    var genres, countries: [Country]?
    var videos: Videos?
    var persons: [Person]?
    var lists: [String]?
    var typeNumber: Int?
    var alternativeName, enName: String?
    var names: [Name]?
    var similarMovies: [SequelsAndPrequel]?
    var updatedAt: UpdatedAt?
    var sequelsAndPrequels: [SequelsAndPrequel]?
    var ratingMPAA: String?
    var shortDescription: String?
    var ticketsOnSale: Bool?
    var ageRating: Int?
    var logo: Logo?
    var watchability: Watchability?
    var top250: Int?
    var audience: [Audience]?
    var isSeries: Bool?
    
    enum CodingKeys: String, CodingKey {
        case fees
        case externalID = "externalId"
        case rating, votes, backdrop, movieLength, id, type, name, description, premiere, slogan, year, budget, poster, facts, genres, countries, videos, persons, lists, typeNumber, alternativeName, enName, names, similarMovies, updatedAt, sequelsAndPrequels
        case ratingMPAA = "ratingMpaa"
        case shortDescription, ticketsOnSale, ageRating, logo, watchability, top250, audience, isSeries
    }
}

// MARK: - Audience
struct Audience: Codable {
    var count: Int?
    var country: String?
}

// MARK: - Backdrop
struct Backdrop: Codable {
    var url, previewURL: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case previewURL = "previewUrl"
    }
}

// MARK: - Budget
struct Budget: Codable {
    var value: Int?
    var currency: Currency?
}

enum Currency: String, Codable {
    case currency = "$"
    case empty = "€"
}

// MARK: - Country
struct Country: Codable {
    var name: String?
}

// MARK: - ExternalID
struct ExternalID: Codable {
    var tmdb: Int?
    var imdb: String?
}

// MARK: - Fact
struct Fact: Codable {
    var value: String?
    var type: FactType?
    var spoiler: Bool?
}

enum FactType: String, Codable {
    case blooper = "BLOOPER"
    case fact = "FACT"
}

// MARK: - Fees
struct Fees: Codable {
    var world, russia, usa: Budget?
}

// MARK: - Logo
struct Logo: Codable {
    var url: String?
}

// MARK: - Name
struct Name: Codable {
    var name, language: String?
    var type: String?
}

// MARK: - Person
struct Person: Codable {
    var id: Int?
    var photo: String?
    var name, enName, description: String?
    var profession: Profession?
    var enProfession: EnProfession?
}

enum EnProfession: String, Codable {
    case actor = "actor"
    case composer = "composer"
    case designer = "designer"
    case director = "director"
    case editor = "editor"
    case enProfessionOperator = "operator"
    case producer = "producer"
    case voiceActor = "voice_actor"
    case writer = "writer"
}

enum Profession: String, Codable {
    case актеры = "актеры"
    case актерыДубляжа = "актеры дубляжа"
    case композиторы = "композиторы"
    case монтажеры = "монтажеры"
    case операторы = "операторы"
    case продюсеры = "продюсеры"
    case редакторы = "редакторы"
    case режиссеры = "режиссеры"
    case художники = "художники"
}

// MARK: - Premiere
struct Premiere: Codable {
    var world, russia, digital, bluray: String?
    var dvd: String?
}

// MARK: - Rating
struct Rating: Codable {
    var kp, imdb, filmCritics, russianFilmCritics: Double?
    var ratingAwait: Double?
    
    enum CodingKeys: String, CodingKey {
        case kp, imdb, filmCritics, russianFilmCritics
        case ratingAwait = "await"
    }
}

// MARK: - SequelsAndPrequel
struct SequelsAndPrequel: Codable {
    var id: Int?
    var name: String?
    var alternativeName, enName: String?
    var type: SequelsAndPrequelType?
    var poster: Backdrop?
    var rating: Rating?
    var year: Int?
}

enum SequelsAndPrequelType: String, Codable {
    case animatedSeries = "animated-series"
    case cartoon = "cartoon"
    case movie = "movie"
    case remake = "remake"
    case tvSeries = "tv-series"
}

enum UpdatedAt: String, Codable {
    case the20231224T010020165Z = "2023-12-24T01:00:20.165Z"
    case the20231224T162226706Z = "2023-12-24T16:22:26.706Z"
    case the20231225T220145801Z = "2023-12-25T22:01:45.801Z"
}

// MARK: - Videos
struct Videos: Codable {
    var trailers: [Trailer]?
}

// MARK: - Trailer
struct Trailer: Codable {
    var url: String?
    var name: String?
    var site: Site?
    var type: TrailerType?
}

enum Site: String, Codable {
    case youtube = "youtube"
}

enum TrailerType: String, Codable {
    case trailer = "TRAILER"
}

// MARK: - Watchability
struct Watchability: Codable {
    var items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    var name: String?
    var logo: Logo?
    var url: String?
}
