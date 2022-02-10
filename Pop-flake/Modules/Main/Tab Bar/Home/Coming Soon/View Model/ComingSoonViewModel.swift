//
//  ComingSoonViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation

final class ComingSoonViewModel: WebServicePlainCollectionViewModel {

    // MARK: - Properties
    
    typealias WebServiceLogicControllerType = ComingSoonLogicController
    typealias CollectionCellViewModelType = FullMovieCellViewModel
    
    var logicController = ComingSoonLogicController(maxItemCount: 10, maxPageCount: 1)
    var cellViewModels = List<FullMovieCellViewModel>()
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return FullMovieCellViewModel(from: $0) }
    }

}
