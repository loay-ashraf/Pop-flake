//
//  TableViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

typealias WebServicePlainTableViewModel = WebServicePlainViewModel & TableViewModel
typealias WebServiceSearchTableViewModel = WebServiceSearchViewModel & TableViewModel

// MARK: - Protocol Definition

protocol TableViewModel: AnyObject {
    
    associatedtype TableCellViewModelType: TableCellViewModel
    
    var cellViewModels: List<TableCellViewModelType> { get }
    var items: Array<TableCellViewModelType> { get }
    var count: Int { get }
    var isEmpty: Bool { get }
    var currentPage: Int { get }
    var isPaginable: Bool { get }
    
}

protocol TableCellViewModel: AnyObject {
    
    associatedtype ModelType
    
    var model: ModelType { get }
    
    init()
    init(from model: ModelType)
    
}

// MARK: - Protocol Extensions

extension TableViewModel {
    
    // MARK: - Properties
    
    var items: Array<TableCellViewModelType> { return cellViewModels.items }
    var count: Int { return cellViewModels.count }
    var isEmpty: Bool { return cellViewModels.isEmpty }
    var currentPage: Int { return cellViewModels.currentPage }
    var isPaginable: Bool { return cellViewModels.isPaginable }
    
}

extension TableCellViewModel {
    
    // MARK: - Initialization
    
    init() {
        self.init()
    }

}
