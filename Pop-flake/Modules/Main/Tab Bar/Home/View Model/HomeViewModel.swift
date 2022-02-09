//
//  HomeViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

// MARK: - Main View Models

final class MostPopularViewModel: WebServicePlainCollectionViewModel {
    
    // MARK: - Properties

    typealias WebServiceLogicControllerType = MostPopularLogicController
    typealias CollectionCellViewModelType = MostPopularCellViewModel
    
    var logicController = MostPopularLogicController()
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

final class ComingSoonViewModel: WebServicePlainCollectionViewModel {

    // MARK: - Properties
    
    typealias WebServiceLogicControllerType = ComingSoonLogicController
    typealias CollectionCellViewModelType = FullMovieCellViewModel
    
    var logicController = ComingSoonLogicController()
    var cellViewModels = List<FullMovieCellViewModel>()
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return FullMovieCellViewModel(from: $0) }
    }

}

final class InTheatersViewModel: WebServicePlainCollectionViewModel {

    // MARK: - Properties
    
    typealias WebServiceLogicControllerType = InTheatersLogicController
    typealias CollectionCellViewModelType = FullMovieCellViewModel
    
    var logicController = InTheatersLogicController()
    var cellViewModels = List<FullMovieCellViewModel>()
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return FullMovieCellViewModel(from: $0) }
    }
    
}

final class TopRatedViewModel: WebServicePlainCollectionViewModel {

    // MARK: - Properties
    
    typealias WebServiceLogicControllerType = TopRatedLogicController
    typealias CollectionCellViewModelType = CompactMovieCellViewModel
    
    var logicController = TopRatedLogicController()
    var cellViewModels = List<CompactMovieCellViewModel>()
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return CompactMovieCellViewModel(from: $0) }
    }

}

final class BoxOfficeViewModel: WebServicePlainTableViewModel {

    // MARK: - Properties
    
    typealias WebServiceLogicControllerType = BoxOfficeLogicController
    typealias TableCellViewModelType = BoxOfficeCellViewModel
    
    var logicController = BoxOfficeLogicController()
    var cellViewModels = List<BoxOfficeCellViewModel>()
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return BoxOfficeCellViewModel(from: $0) }
    }

}

// MARK: - Cell Models

final class MostPopularCellViewModel: CollectionCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = CompactMovie
    
    var model: CompactMovie
    var title: String
    var rating: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = CompactMovie()
        title = ""
        rating = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: CompactMovie) {
        self.model = model
        title = model.title
        rating = model.imDBRating
        image = model.image
    }
    
}

final class FullMovieCellViewModel: CollectionCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = FullMovie
    
    var model: FullMovie
    var title: String
    var rating: String
    var ratingCount: String
    var year: String
    var contentRating: String
    var runtimeString: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = FullMovie()
        title = ""
        rating = ""
        ratingCount = ""
        year = ""
        contentRating = ""
        runtimeString = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: FullMovie) {
        self.model = model
        title = model.title
        rating = model.imDBRating
        ratingCount = model.imDBRatingCount
        year = model.year
        contentRating = model.contentRating
        runtimeString = model.runtimeStr
        image = model.image
    }
    
}

final class CompactMovieCellViewModel: CollectionCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = CompactMovie
    
    var model: CompactMovie
    var title: String
    var year: String
    var rating: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = CompactMovie()
        title = ""
        year = ""
        rating = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: CompactMovie) {
        self.model = model
        title = model.title
        year = model.year
        rating = model.imDBRating
        image = model.image
    }
    
}

final class BoxOfficeCellViewModel: TableCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = BoxOfficeMovie
    
    var model: BoxOfficeMovie
    var title: String
    var gross: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = BoxOfficeMovie()
        title = ""
        gross = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: BoxOfficeMovie) {
        self.model = model
        title = model.title
        gross = model.gross
        image = model.image
    }
    
}

