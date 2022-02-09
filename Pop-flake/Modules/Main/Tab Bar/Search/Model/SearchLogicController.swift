//
//  SearchLogicController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

final class SearchMovieLogicController: WebServiceSearchLogicController<imDBClient,SearchResult> {
    
    // MARK: - Load Method

    override func load(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.searchMovies(query: query, completionHandler: processWebServiceResult(result:))
    }
    
}

final class SearchSeriesLogicController: WebServiceSearchLogicController<imDBClient,SearchResult> {
    
    // MARK: - Load Method

    override func load(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.searchSeries(query: query, completionHandler: processWebServiceResult(result:))
    }
    
}

