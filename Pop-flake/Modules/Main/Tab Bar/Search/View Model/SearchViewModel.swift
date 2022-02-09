//
//  SearchViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

// MARK: - Main View Models

final class MovieSearchViewModel: WebServiceSearchTableViewModel {
    
    // MARK: - Properties

    typealias WebServiceLogicControllerType = MovieSearchLogicController
    typealias TableCellViewModelType = SearchResultCellViewModel
    
    var logicController = MovieSearchLogicController()
    var cellViewModels = List<SearchResultCellViewModel>()
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return SearchResultCellViewModel(from: $0) }
    }
    
}

final class SeriesSearchViewModel: WebServiceSearchTableViewModel {
    
    // MARK: - Properties

    typealias WebServiceLogicControllerType = MovieSearchLogicController
    typealias TableCellViewModelType = SearchResultCellViewModel
    
    var logicController = MovieSearchLogicController()
    var cellViewModels = List<SearchResultCellViewModel>()
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return SearchResultCellViewModel(from: $0) }
    }
    
}

// MARK: - Cell Models

final class SearchResultCellViewModel: TableCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = SearchResult
    
    var model: SearchResult
    var title: String
    var description: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = SearchResult()
        title = ""
        description = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: SearchResult) {
        self.model = model
        title = model.title
        description = model.resultDescription
        image = model.image
    }
    
}
