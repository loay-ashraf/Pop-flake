//
//  MostPopularViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation

final class MostPopularViewModel: WebServicePlainCollectionViewModel {
    
    // MARK: - Properties

    typealias WebServiceLogicControllerType = MostPopularLogicController
    typealias CollectionCellViewModelType = MostPopularCellViewModel
    
    var logicController = MostPopularLogicController(maxItemCount: 10, maxPageCount: 1)
    var cellViewModels = List<MostPopularCellViewModel>()
    
    // MARK: - Load Methods
    
    func loadTrailer(forItem item: Int, then handler: @escaping (Result<MovieTrailer,NetworkError>) -> Void) {
        logicController.loadTrailer(forItem: item, then: handler)
    }
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return MostPopularCellViewModel(from: $0) }
    }
    
}

final class MostPopularCellViewModel: CollectionCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = CompactMovie
    
    var model: CompactMovie
    var id: String
    var title: String
    var rating: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = CompactMovie()
        id = ""
        title = ""
        rating = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: CompactMovie) {
        self.model = model
        id = model.id
        title = model.title
        rating = model.imDBRating
        image = model.image
    }
    
}
