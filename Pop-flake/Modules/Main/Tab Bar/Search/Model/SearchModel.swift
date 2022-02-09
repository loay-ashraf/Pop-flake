//
//  SearchModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

// MARK: - Search
struct SearchResultList: Codable {
    let searchType, expression: String
    let results: [SearchResult]
    let errorMessage: String
}

// MARK: - Result
struct SearchResult: Model {
    // Placeholder types till cell view model types are implemented
    typealias CollectionCellViewModelType = Int
    typealias TableCellViewModelType = String
    
    let id, resultType: String
    let image: URL
    let title, resultDescription: String

    enum CodingKeys: String, CodingKey {
        case id, resultType, image, title
        case resultDescription = "description"
    }
}
