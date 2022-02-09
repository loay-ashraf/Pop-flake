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
