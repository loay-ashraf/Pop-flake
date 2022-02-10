//
//  MostPopularDataSource.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class MostPopularDataSource: PagerViewDataSource<MostPopularCellViewModel> {
    
    override init() {
        super.init()
        cellClass = MostPopularCell.self
        cellConfigurator = MostPopularCellConfigurator()
    }
    
}
