//
//  TopRatedViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation

final class TopRatedViewModel: WebServicePlainCollectionViewModel {

    // MARK: - Properties
    
    typealias WebServiceLogicControllerType = TopRatedLogicController
    typealias CollectionCellViewModelType = CompactMovieCellViewModel
    
    var logicController = TopRatedLogicController(maxItemCount: 250, maxPageCount: 1)
    var cellViewModels = List<CompactMovieCellViewModel>()
    
    // MARK: - Synchronize Properties Method

    func synchronizeProperties() {
        let modelItems = logicController.model.items
        cellViewModels.items = modelItems.map { return CompactMovieCellViewModel(from: $0) }
    }

}
