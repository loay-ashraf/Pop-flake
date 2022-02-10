//
//  HomeCollectionViewDataSource.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class FullMovieDataSource: SKCollectionViewDataSource<FullMovieCellViewModel> {
    
    override init() {
        super.init()
        cellClass = FullMovieCell.self
        cellConfigurator = FullMovieCellConfigurator()
    }
    
}

class CompactMovieDataSource: SKCollectionViewDataSource<CompactMovieCellViewModel> {
    
    override init() {
        super.init()
        cellClass = CompactMovieCell.self
        cellConfigurator = CompactMovieCellConfigurator()
    }
    
}
