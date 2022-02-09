//
//  Constants.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

typealias NetworkingConstants = Constants.NetworkingConstants

struct Constants {
    
    struct NetworkingConstants {
        
        static let apiBaseUrl = "https://imdb-api.com/API"
        
        static let mostPopular = "MostPopularMovies"
        static let comingSoon = "ComingSoon"
        static let inTheaters = "InTheaters"
        static let topRated = "Top250Movies"
        static let boxOffice = "BoxOffice"
        static let trailer = "Trailer"
        static let searchMovies = "SearchMovie"
        static let searchSeries = "SearchSeries"
        
        static let apiKey = "k_b0u5794q"
        
        static let maxPageCount = 100
        static let minimumPageCapacity = 10
        
    }
    
}
