//
//  HomeLogicController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

final class MostPopularLogicController: WebServicePlainLogicController<imDBClient,CompactMovie> {
    
    // MARK: - Load Method
    
    override func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchMostPopular(completionHandler: processWebServiceResult(result:))
    }
    
}

final class CominSoonLogicController: WebServicePlainLogicController<imDBClient,FullMovie> {
    
    // MARK: - Load Method
    
    override func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchComingSoon(completionHandler: processWebServiceResult(result:))
    }
    
}

final class InTheatersLogicController: WebServicePlainLogicController<imDBClient,FullMovie> {
    
    // MARK: - Load Method
    
    override func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchInTheaters(completionHandler: processWebServiceResult(result:))
    }
    
}

final class TopRatedLogicController: WebServicePlainLogicController<imDBClient,CompactMovie> {
    
    // MARK: - Load Method
    
    override func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchTopRated(completionHandler: processWebServiceResult(result:))
    }
    
}

final class BoxOfficeLogicController: WebServicePlainLogicController<imDBClient,BoxOfficeMovie> {
    
    // MARK: - Load Method
    
    override func load(then handler: @escaping NetworkLoadingHandler) {
        self.handler = handler
        webServiceProvider.fetchBoxOffice(completionHandler: processWebServiceResult(result:))
    }
    
}
