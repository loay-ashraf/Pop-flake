//
//  HomeTableViewDataSource.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

class BoxOfficeDataSource: TableViewDataSource<BoxOfficeCellViewModel> {
    
    override init() {
        super.init()
        cellClass = BoxOfficeCell.self
        cellConfigurator = BoxOfficeCellConfigurator()
    }
    
}
