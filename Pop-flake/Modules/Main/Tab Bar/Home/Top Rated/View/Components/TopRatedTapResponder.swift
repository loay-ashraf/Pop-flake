//
//  TopRatedTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class TopRatedTapResponder: CollectionViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? TopRatedViewController {
            viewController.showDetail(atItem: item)
        }
    }
    
}
