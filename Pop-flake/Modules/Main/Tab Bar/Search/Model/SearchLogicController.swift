//
//  SearchLogicController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

final class MovieSearchLogicController: WebServiceSearchLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceProviderType = imDBClient
    typealias ModelType = SearchResult
    
    var webServiceProvider = imDBClient()
    var model = List<SearchResult>()
    var handler: NetworkLoadingHandler?
    var maxItemCount: Int?
    var maxPageCount: Int = NetworkingConstants.maxPageCount
    
    // MARK: - Load Method

    func load(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.searchMovies(query: query, completionHandler: processWebServiceResult(result:))
    }
    
}

final class SearchSeriesLogicController: WebServiceSearchLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceProviderType = imDBClient
    typealias ModelType = SearchResult
    
    var webServiceProvider = imDBClient()
    var model = List<SearchResult>()
    var handler: NetworkLoadingHandler?
    var maxItemCount: Int?
    var maxPageCount: Int = NetworkingConstants.maxPageCount
    
    // MARK: - Load Method

    func load(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.searchSeries(query: query, completionHandler: processWebServiceResult(result:))
    }
    
}

