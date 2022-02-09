//
//  ModelProtocols.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

protocol Model: Codable, Equatable {
    
    associatedtype CollectionCellViewModelType
    associatedtype TableCellViewModelType
    
    init(from collectionCellViewModel: CollectionCellViewModelType)
    init(from tableCellViewModel: TableCellViewModelType)

}

extension Model {
    
    init(from collectionCellViewModel: CollectionCellViewModelType) {
        fatalError("This model can't be initialized using collection cell view model")
    }
    
    init(from tableCellViewModel: TableCellViewModelType) {
        fatalError("This model can't be initialized using table cell view model")
    }
    
}

protocol WebServiceLogicController: AnyObject {
    
    associatedtype WebServiceProviderType: WebServiceProvider
    associatedtype ModelType: Model
    
    var webServiceProvider: WebServiceProviderType { get }
    var model: List<ModelType> { get set }
    var handler: NetworkLoadingHandler? { get set }
    var maxItemCount: Int? { get }
    var maxPageCount: Int { get }
    
    init(maxItemCount: Int?, maxPageCount: Int)
    
    func load(then handler: @escaping NetworkLoadingHandler)
    func refresh(then handler: @escaping NetworkLoadingHandler)
    func paginate(then handler: @escaping NetworkLoadingHandler)
    func reset()
    func processWebServiceResult(result: Result<Array<ModelType>, NetworkError>)
    func updateModelProperties(newItemsCount: Int)
    
}

extension WebServiceLogicController {
    
    // MARK: - Initialization
    
    init(maxItemCount: Int? = nil, maxPageCount: Int = NetworkingConstants.maxPageCount) {
        self.init(maxItemCount: maxItemCount, maxPageCount: maxPageCount)
    }
    
    // MARK: - Load, Refresh and Paginate Methods
    
    func refresh(then handler: @escaping NetworkLoadingHandler) {
        reset()
        load(then: handler)
    }
    
    func paginate(then handler: @escaping NetworkLoadingHandler) {
        load(then: handler)
    }
    
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
