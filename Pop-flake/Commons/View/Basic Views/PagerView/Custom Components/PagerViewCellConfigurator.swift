//
//  PagerViewCellConfigurator.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView

class PagerViewCellConfigurator {
    
    func configure<T: CollectionCellViewModel>(_ cell: PagerViewCell, forDisplaying item: T) { /* override this method in sub classes */ }
    
}
