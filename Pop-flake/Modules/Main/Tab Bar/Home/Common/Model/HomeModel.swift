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
struct FullMovie: Model {
    
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
struct RList: Codable, Equatable {
    let id, name: String
}

// MARK: - GenreList
struct GenreList: Codable, Equatable {
    let key, value: String
}

// MARK: - CompactMovie
struct CompactMovie: Model {
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

// MARK: - MovieTrailer
struct MovieTrailer: Codable, Equatable {
    let imDBID, title, fullTitle, type: String
    let year, videoID: String
    let videoURL: URL
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
    case imDBID = "imDbId"
    case title, fullTitle, type, year
    case videoID = "videoId"
    case videoURL = "videoUrl"
    case errorMessage
    }
}
