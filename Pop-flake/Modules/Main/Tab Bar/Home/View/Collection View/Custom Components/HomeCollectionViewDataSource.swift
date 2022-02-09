//
//  HomeCollectionViewDataSource.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class MostPopularDataSource: CollectionViewDataSource<MostPopularCellViewModel> {
    
    override init() {
        super.init()
        cellClass = MostPopularCell.self
        cellConfigurator = MostPopularCellConfigurator()
    }
    
}

class FullMovieDataSource: CollectionViewDataSource<FullMovieCellViewModel> {
    
    override init() {
        super.init()
        cellClass = FullMovieCell.self
        cellConfigurator = FullMovieCellConfigurator()
    }
    
}

class CompactMovieDataSource: CollectionViewDataSource<CompactMovieCellViewModel> {
    
    override init() {
        super.init()
        cellClass = CompactMovieCell.self
        cellConfigurator = CompactMovieCellConfigurator()
    }
    
}
