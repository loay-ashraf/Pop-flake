//
//  BoxOfficeDataSource.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class BoxOfficeDataSource: SKTableViewDataSource<BoxOfficeCellViewModel> {
    
    override init() {
        super.init()
        cellClass = BoxOfficeCell.self
        cellConfigurator = BoxOfficeCellConfigurator()
    }
    
}
