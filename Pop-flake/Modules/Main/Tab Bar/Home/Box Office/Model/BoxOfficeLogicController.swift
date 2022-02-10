//
//  BoxOfficeLogicController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation

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
