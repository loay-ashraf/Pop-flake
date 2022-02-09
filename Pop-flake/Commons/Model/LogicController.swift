//
//  LogicController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

// MARK: - Protocol Definition

protocol WebServiceLogicController: AnyObject {
    
    associatedtype WebServiceProviderType: WebServiceProvider
    associatedtype ModelType: Model
    
    var webServiceProvider: WebServiceProviderType { get }
    var model: List<ModelType> { get set }
    var handler: NetworkLoadingHandler? { get set }
    var maxItemCount: Int? { get }
    var maxPageCount: Int { get }
    
    init(maxItemCount: Int?, maxPageCount: Int)
    
    func reset()
    func processWebServiceResult(result: Result<Array<ModelType>, NetworkError>)
    func updateModelProperties(newItemsCount: Int)
    
}

protocol WebServicePlainLogicController: WebServiceLogicController {
    
    func load(then handler: @escaping NetworkLoadingHandler)
    func refresh(then handler: @escaping NetworkLoadingHandler)
    func paginate(then handler: @escaping NetworkLoadingHandler)
    
}

protocol WebServiceSearchLogicController: WebServiceLogicController {
    
    func load(withQuery query: String, then handler: @escaping NetworkLoadingHandler)
    func refresh(withQuery query: String, then handler: @escaping NetworkLoadingHandler)
    func paginate(withQuery query: String, then handler: @escaping NetworkLoadingHandler)
    
}

// MARK: - Protocol Extensions

extension WebServiceLogicController {
    
    // MARK: - Initialization
    
    init(maxItemCount: Int? = nil, maxPageCount: Int = NetworkingConstants.maxPageCount) {
        self.init(maxItemCount: maxItemCount, maxPageCount: maxPageCount)
    }
    
    // MARK: - Reset Method
    
    func reset() {
        model.reset(isPagiable: true)
    }
    
    // MARK: - Web Service Result Processing Methods
    
    func processWebServiceResult(result: Result<Array<ModelType>, NetworkError>) {
        switch result {
        case .success(let response): model.append(contentsOf: response)
                                     updateModelProperties(newItemsCount: response.count)
                                     handler?(nil)
        case .failure(let networkError): handler?(networkError)
        }
    }
    
    // MARK: - Model Property Update Methods
    
    func updateModelProperties(newItemsCount: Int) {
        if model.count == maxItemCount || model.currentPage == maxPageCount || newItemsCount < NetworkingConstants.minimumPageCapacity {
            model.isPaginable = false
        } else {
            model.currentPage += 1
        }
    }
    
}

extension WebServicePlainLogicController {
    
    // MARK: - Refresh and Paginate methods

    func refresh(then handler: @escaping NetworkLoadingHandler) {
        reset()
        load(then: handler)
    }
    
    func paginate(then handler: @escaping NetworkLoadingHandler) {
        load(then: handler)
    }
    
}

extension WebServiceSearchLogicController {
    
    // MARK: - Refresh and Paginate methods

    func refresh(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        reset()
        load(withQuery: query, then: handler)
    }
    
    func paginate(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        load(withQuery: query, then: handler)
    }
    
}
