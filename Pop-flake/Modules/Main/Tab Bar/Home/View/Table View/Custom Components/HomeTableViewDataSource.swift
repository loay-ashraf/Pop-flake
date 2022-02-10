//
//  HomeTableViewDataSource.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

class BoxOfficeDataSource: SKTableViewDataSource<BoxOfficeCellViewModel> {
    
    override init() {
        super.init()
        cellClass = BoxOfficeCell.self
        cellConfigurator = BoxOfficeCellConfigurator()
    }
    
}
