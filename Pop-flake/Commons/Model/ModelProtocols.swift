//
//  ModelProtocols.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

// MARK: - Protocol Definition

protocol Model: Codable, Equatable {

    init()
    init<T: CollectionCellViewModel>(from collectionCellViewModel: T)
    init<T: TableCellViewModel>(from tableCellViewModel: T)

}

// MARK: - Protocol Extensions

extension Model {
    
    // MARK: - Initialization
    
    init() {
        self.init()
    }
    
    init<T: CollectionCellViewModel>(from collectionCellViewModel: T) {
        fatalError("This model can't be initialized using collection cell view model")
    }
    
    init<T: TableCellViewModel>(from tableCellViewModel: T) {
        fatalError("This model can't be initialized using table cell view model")
    }
    
}
