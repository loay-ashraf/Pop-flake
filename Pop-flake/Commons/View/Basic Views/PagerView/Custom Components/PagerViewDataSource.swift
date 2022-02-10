//
//  PagerViewDataSource.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView

class PagerViewDataSource<T: CollectionCellViewModel>: NSObject, FSPagerViewDataSource {

    // MARK: - Properties
    
    var cellViewModels = Array<T>()
    weak var pagerView: PagerView? { didSet { registerCell() } }
    var cellClass: PagerViewCell.Type?
    var cellConfigurator: PagerViewCellConfigurator?
    
    // MARK: - Cell Registeration Methods
    
    func registerCell() {
        if let pagerView = pagerView, let cellClass = cellClass {
            pagerView.registerNib(cellClass: cellClass)
        }
    }
    
    // MARK: - Data Source
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return cellViewModels.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if let pagerView = self.pagerView, let cellClass = cellClass, let cellConfigurator = cellConfigurator {
            let cell = pagerView.dequeue(cellClass: cellClass, at: index)
            let item = cellViewModels[index]
                    
            // Configure the cell...
            cellConfigurator.configure(cell, forDisplaying: item)

            return cell
        }
        return PagerViewCell()
    }

}
