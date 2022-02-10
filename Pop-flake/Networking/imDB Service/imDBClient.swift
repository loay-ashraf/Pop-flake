//
//  imDBClient.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

final class imDBClient: WebServiceProvider {
    
    func fetchMostPopular(completionHandler: @escaping (Result<[CompactMovie],NetworkError>) -> Void) {
        func mappingHandler(result: Result<MovieList<CompactMovie>,NetworkError>) {
            completionHandler(result.flatMap { (movieList) -> Result<[CompactMovie],NetworkError> in return .success(movieList.items) })
        }
        networkManager.request(imDBRouter.mostPopular, completionHandler: mappingHandler)
    }
    
    func fetchComingSoon(completionHandler: @escaping (Result<[FullMovie],NetworkError>) -> Void) {
        func mappingHandler(result: Result<MovieList<FullMovie>,NetworkError>) {
            completionHandler(result.flatMap { (movieList) -> Result<[FullMovie],NetworkError> in return .success(movieList.items) })
        }
        networkManager.request(imDBRouter.comingSoon, completionHandler: mappingHandler)
    }
    
    func fetchInTheaters(completionHandler: @escaping (Result<[FullMovie],NetworkError>) -> Void) {
        func mappingHandler(result: Result<MovieList<FullMovie>,NetworkError>) {
            completionHandler(result.flatMap { (movieList) -> Result<[FullMovie],NetworkError> in return .success(movieList.items) })
        }
        networkManager.request(imDBRouter.inTheaters, completionHandler: mappingHandler)
    }
    
    func fetchTopRated(completionHandler: @escaping (Result<[CompactMovie],NetworkError>) -> Void) {
        func mappingHandler(result: Result<MovieList<CompactMovie>,NetworkError>) {
            completionHandler(result.flatMap { (movieList) -> Result<[CompactMovie],NetworkError> in return .success(movieList.items) })
        }
        networkManager.request(imDBRouter.topRated, completionHandler: mappingHandler)
    }
    
    func fetchBoxOffice(completionHandler: @escaping (Result<[BoxOfficeMovie],NetworkError>) -> Void) {
        func mappingHandler(result: Result<MovieList<BoxOfficeMovie>,NetworkError>) {
            completionHandler(result.flatMap { (movieList) -> Result<[BoxOfficeMovie],NetworkError> in return .success(movieList.items) })
        }
        networkManager.request(imDBRouter.boxOffice, completionHandler: mappingHandler)
    }
    
    func fetchMovieTrailer(id: String, completionHandler: @escaping (Result<MovieTrailer,NetworkError>) -> Void) {
        networkManager.request(imDBRouter.movieTrailer(id: id), completionHandler: completionHandler)
    }
    
    func searchMovies(query: String, completionHandler: @escaping (Result<[SearchResult],NetworkError>) -> Void) {
        func mappingHandler(result: Result<SearchResultList,NetworkError>) {
            completionHandler(result.flatMap { (searchResultList) -> Result<[SearchResult],NetworkError> in return .success(searchResultList.results) })
        }
        networkManager.request(imDBRouter.searchMovies(query: query), completionHandler: mappingHandler)
    }
    
    func searchSeries(query: String, completionHandler: @escaping (Result<[SearchResult],NetworkError>) -> Void) {
        func mappingHandler(result: Result<SearchResultList,NetworkError>) {
            completionHandler(result.flatMap { (searchResultList) -> Result<[SearchResult],NetworkError> in return .success(searchResultList.results) })
        }
        networkManager.request(imDBRouter.searchSeries(query: query), completionHandler: mappingHandler)
    }

}
