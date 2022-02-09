//
//  ModelLogicController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

class WebServiceLogicController<T: WebServiceProvider,U: Model> {
    
    // MARK: - Properties
    
    var webServiceProvider = T()
    var model = List<U>()
    var handler: NetworkLoadingHandler?
    var maxItemCount: Int?
    var maxPageCount: Int
    
    // MARK: - Initialization
    
    init(maxItemCount: Int? = nil, maxPageCount: Int = NetworkingConstants.maxPageCount) {
        self.maxItemCount = maxItemCount
        self.maxPageCount = maxPageCount
    }
    
    // MARK: - Reset Method
    
    func reset() {
        model.reset(isPagiable: true)
    }
    
    // MARK: - Web Service Result Processing Methods
    
    func processWebServiceResult(result: Result<Array<U>, NetworkError>) {
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

class WebServicePlainLogicController<T: WebServiceProvider,U: Model>: WebServiceLogicController<T,U> {
    
    // MARK: - Load, Refresh and Paginate methods
    
    func load(then handler: @escaping NetworkLoadingHandler) {
        fatalError("\(String(describing: Self.self)) doesn't implement load method")
    }
    
    func refresh(then handler: @escaping NetworkLoadingHandler) {
        reset()
        load(then: handler)
    }
    
    func paginate(then handler: @escaping NetworkLoadingHandler) {
        load(then: handler)
    }
    
}

class WebServiceSearchLogicController<T: WebServiceProvider,U: Model>: WebServiceLogicController<T,U> {
    
    // MARK: - Load, Refresh and Paginate methods
    
    func load(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        fatalError("\(String(describing: Self.self)) doesn't implement load method")
    }
    
    func refresh(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        reset()
        load(withQuery: query, then: handler)
    }
    
    func paginate(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        load(withQuery: query, then: handler)
    }
    
}
