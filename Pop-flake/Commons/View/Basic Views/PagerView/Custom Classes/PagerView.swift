//
//  PagerView.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView

class PagerView: FSPagerView {
    
    // MARK: - Properties
    
    var registeredCells = [PagerViewCell.Type]()
    
    // MARK: - Data Source and Delegate Methods
    
    func setDataSource<T: CollectionCellViewModel>(_ dataSource: PagerViewDataSource<T>) {
        self.dataSource = dataSource
        dataSource.pagerView = self
    }
    
    func setDelegate(_ delegate: PagerViewDelegate) {
        self.delegate = delegate
        delegate.pagerView = self
    }
    
    // MARK: - Cell Methods
    
    func registerClass<T: PagerViewCell>(cellClass: T.Type) {
        if !registeredCells.contains(where: { $0 == cellClass }) {
            register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
            registeredCells.append(cellClass)
        }
    }
    
    func registerNib<T: PagerViewCell>(cellClass: T.Type) {
        if !registeredCells.contains(where: { $0 == cellClass }) {
            register(cellClass.nib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
            registeredCells.append(cellClass)
        }
    }
    
    func dequeue<T: PagerViewCell>(cellClass: T.Type, at index: Int) -> T {
        if registeredCells.contains(where: { $0 == cellClass }) {
            return dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, at: index) as! T
        }
        return PagerViewCell() as! T
    }
    
}
