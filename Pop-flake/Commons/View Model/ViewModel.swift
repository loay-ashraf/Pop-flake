//
//  ViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

// MARK: - Protocol Definition

protocol WebServiceViewModel {
    
    associatedtype WebServiceLogicControllerType: WebServiceLogicController
    
    var logicController: WebServiceLogicControllerType { get }

    init()
    
    func reset()
    func synchronizeProperties()
    
}

protocol WebServicePlainViewModel: WebServiceViewModel where WebServiceLogicControllerType: WebServicePlainLogicController {
    
    func load(then handler: @escaping NetworkLoadingHandler)
    func refresh(then handler: @escaping NetworkLoadingHandler)
    func paginate(then handler: @escaping NetworkLoadingHandler)
    
}

protocol WebServiceSearchViewModel: WebServiceViewModel where WebServiceLogicControllerType: WebServiceSearchLogicController {
    
    func load(withQuery query: String, then handler: @escaping NetworkLoadingHandler)
    func refresh(withQuery query: String, then handler: @escaping NetworkLoadingHandler)
    func paginate(withQuery query: String, then handler: @escaping NetworkLoadingHandler)
    
}

// MARK: - Protocol Extensions

extension WebServiceViewModel {
    
    // MARK: - Initialization
    
    init() {
        self.init()
    }
    
    // MARK: - Reset Method
    
    func reset() {
        logicController.reset()
        synchronizeProperties()
    }
    
}

extension WebServicePlainViewModel {
    
    // MARK: - Load, Refresh and Paginate methods
    
    func load(then handler: @escaping NetworkLoadingHandler) {
        logicController.load { networkError in
            if let networkError = networkError {
                handler(networkError)
            } else {
                synchronizeProperties()
                handler(nil)
            }
        }
    }
    
    func refresh(then handler: @escaping NetworkLoadingHandler) {
        reset()
        load(then: handler)
    }
    
    func paginate(then handler: @escaping NetworkLoadingHandler) {
        load(then: handler)
    }
    
}

extension WebServiceSearchViewModel {
    
    // MARK: - Load, Refresh and Paginate methods
    
    func load(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        logicController.load(withQuery: query) { networkError in
            if let networkError = networkError {
                handler(networkError)
            } else {
                synchronizeProperties()
                handler(nil)
            }
        }
    }
    
    func refresh(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        reset()
        load(withQuery: query, then: handler)
    }
    
    func paginate(withQuery query: String, then handler: @escaping NetworkLoadingHandler) {
        load(withQuery: query, then: handler)
    }
    
}
