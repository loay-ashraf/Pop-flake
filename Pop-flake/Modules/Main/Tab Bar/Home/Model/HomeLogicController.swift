//
//  HomeLogicController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

final class MostPopularLogicController: WebServicePlainLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceProviderType = imDBClient
    typealias ModelType = CompactMovie
    
    var webServiceProvider = imDBClient()
    var model = List<CompactMovie>()
    var handler: NetworkLoadingHandler?
    var maxItemCount: Int?
    var maxPageCount: Int = NetworkingConstants.maxPageCount
    
    // MARK: - Initialization
    
    init(maxItemCount: Int?, maxPageCount: Int) {
        self.maxItemCount = maxItemCount
        self.maxPageCount = maxPageCount
    }
    
    // MARK: - Load Methods
    
    func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchMostPopular(completionHandler: processWebServiceResult(result:))
    }
    
    func loadTrailer(forItem item: Int, then handler: @escaping (Result<MovieTrailer,NetworkError>) -> Void) {
        if item < model.count, !model.items[item].id.isEmpty {
            let id = model.items[item].id
            webServiceProvider.fetchMovieTrailer(id: id, completionHandler: handler)
        }
    }
    
}

final class ComingSoonLogicController: WebServicePlainLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceProviderType = imDBClient
    typealias ModelType = FullMovie
    
    var webServiceProvider = imDBClient()
    var model = List<FullMovie>()
    var handler: NetworkLoadingHandler?
    var maxItemCount: Int?
    var maxPageCount: Int = NetworkingConstants.maxPageCount
    
    // MARK: - Initialization
    
    init(maxItemCount: Int?, maxPageCount: Int) {
        self.maxItemCount = maxItemCount
        self.maxPageCount = maxPageCount
    }
    
    // MARK: - Load Method
    
    func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchComingSoon(completionHandler: processWebServiceResult(result:))
    }
    
}

final class InTheatersLogicController: WebServicePlainLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceProviderType = imDBClient
    typealias ModelType = FullMovie
    
    var webServiceProvider = imDBClient()
    var model = List<FullMovie>()
    var handler: NetworkLoadingHandler?
    var maxItemCount: Int?
    var maxPageCount: Int = NetworkingConstants.maxPageCount
    
    // MARK: - Initialization
    
    init(maxItemCount: Int?, maxPageCount: Int) {
        self.maxItemCount = maxItemCount
        self.maxPageCount = maxPageCount
    }
    
    // MARK: - Load Method
    
    func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchInTheaters(completionHandler: processWebServiceResult(result:))
    }
    
}

final class TopRatedLogicController: WebServicePlainLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceProviderType = imDBClient
    typealias ModelType = CompactMovie
    
    var webServiceProvider = imDBClient()
    var model = List<CompactMovie>()
    var handler: NetworkLoadingHandler?
    var maxItemCount: Int?
    var maxPageCount: Int = NetworkingConstants.maxPageCount
    
    // MARK: - Initialization
    
    init(maxItemCount: Int?, maxPageCount: Int) {
        self.maxItemCount = maxItemCount
        self.maxPageCount = maxPageCount
    }
    
    // MARK: - Load Method
    
    func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchTopRated(completionHandler: processWebServiceResult(result:))
    }
    
}

final class BoxOfficeLogicController: WebServicePlainLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceProviderType = imDBClient
    typealias ModelType = BoxOfficeMovie
    
    var webServiceProvider = imDBClient()
    var model = List<BoxOfficeMovie>()
    var handler: NetworkLoadingHandler?
    var maxItemCount: Int?
    var maxPageCount: Int = NetworkingConstants.maxPageCount
    
    // MARK: - Initialization
    
    init(maxItemCount: Int?, maxPageCount: Int) {
        self.maxItemCount = maxItemCount
        self.maxPageCount = maxPageCount
    }
    
    // MARK: - Load Method
    
    func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchBoxOffice(completionHandler: processWebServiceResult(result:))
    }
    
}
