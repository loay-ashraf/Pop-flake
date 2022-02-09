//
//  HomeModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

// MARK: - MovieList
struct MovieList<T: Codable>: Codable {
    let items: [T]
    let errorMessage: String
}

// MARK: - Movie
struct FullMovie: Codable {
    let id, title, fullTitle, year: String
    let releaseState: String
    let image: URL
    let runtimeMins, runtimeStr, plot, contentRating: String
    let imDBRating, imDBRatingCount, metacriticRating, genres: String
    let genreList: [GenreList]
    let directors: String
    let directorList: [RList]
    let stars: String
    let starList: [RList]

    enum CodingKeys: String, CodingKey {
        case id, title, fullTitle, year, releaseState, image, runtimeMins, runtimeStr, plot, contentRating
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
        case metacriticRating, genres, genreList, directors, directorList, stars, starList
    }
}

// MARK: - RList
struct RList: Codable {
    let id, name: String
}

// MARK: - GenreList
struct GenreList: Codable {
    let key, value: String
}

// MARK: - TopRatedMovie
struct TopRatedMovie: Codable {
    let id, rank, title, fullTitle: String
    let year: String
    let image: URL
    let crew, imDBRating, imDBRatingCount: String

    enum CodingKeys: String, CodingKey {
        case id, rank, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}

// MARK: - Item
struct BoxOfficeMovie: Codable {
    let id, rank, title: String
    let image: URL
    let weekend, gross, weeks: String
}

// MARK: - MovieTrailer
struct MovieTrailer: Codable {
    let imDBID, title, fullTitle, type: String
    let year, videoID, videoTitle, videoDescription: String
    let thumbnailURL: URL
    let uploadDate: String?
    let link, linkEmbed: URL
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case imDBID = "imDbId"
        case title, fullTitle, type, year
        case videoID = "videoId"
        case videoTitle, videoDescription
        case thumbnailURL = "thumbnailUrl"
        case uploadDate, link, linkEmbed, errorMessage
    }
}
