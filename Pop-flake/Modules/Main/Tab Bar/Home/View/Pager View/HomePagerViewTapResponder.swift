//
//  HomePagerViewTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class MostPopularTapResponder: PagerViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? MostPopularViewController {
            viewController.showDetail(atItem: item)
        }
    }
    
}
