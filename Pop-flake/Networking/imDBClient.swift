//
//  imDBClient.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

class imDBClient {
    
    static let networkManager = NetworkManager.standard
    
    class func fetchMovieTrailer(id: String, completionHandler: @escaping (Result<MovieTrailer,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.trailer(id: id), completionHandler: completionHandler)
    }
    
    class func fetchMostPopular(completionHandler: @escaping (Result<MostPopular,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.mostPopular, completionHandler: completionHandler)
    }
    
    class func fetchComingSoon(completionHandler: @escaping (Result<ComingSoon,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.comingSoon, completionHandler: completionHandler)
    }
    
    class func fetchInTheaters(completionHandler: @escaping (Result<InTheaters,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.inTheaters, completionHandler: completionHandler)
    }
    
    class func fetchTopRated(completionHandler: @escaping (Result<TopRated,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.topRated, completionHandler: completionHandler)
    }
    
    class func fetchBoxOffice(completionHandler: @escaping (Result<BoxOffice,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.boxOffice, completionHandler: completionHandler)
    }
    
    class func searchMovies(query: String, completionHandler: @escaping (Result<Search,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.searchMovies(query: query), completionHandler: completionHandler)
    }
    
    class func searchSeries(query: String, completionHandler: @escaping (Result<Search,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.searchSeries(query: query), completionHandler: completionHandler)
    }

}
