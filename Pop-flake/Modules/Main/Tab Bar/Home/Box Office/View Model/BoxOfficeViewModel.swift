//
//  BoxOfficeViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation

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

final class BoxOfficeCellViewModel: TableCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = BoxOfficeMovie
    
    var model: BoxOfficeMovie
    var id: String
    var title: String
    var gross: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = BoxOfficeMovie()
        id = ""
        title = ""
        gross = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: BoxOfficeMovie) {
        self.model = model
        id = model.id
        title = model.title
        gross = model.gross
        image = model.image
    }
    
}

