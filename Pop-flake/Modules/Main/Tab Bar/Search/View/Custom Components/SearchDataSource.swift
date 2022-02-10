//
//  SearchDataSource.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class SearchResultDataSource: TableViewDataSource<SearchResultCellViewModel> {
    
    override init() {
        super.init()
        cellClass = SearchResultCell.self
        cellConfigurator = SearchResultCellConfigurator()
    }
    
}
