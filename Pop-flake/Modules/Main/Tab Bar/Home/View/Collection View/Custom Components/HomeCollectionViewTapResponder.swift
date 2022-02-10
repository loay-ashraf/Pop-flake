//
//  HomeCollectionViewTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class ComingSoonTapResponder: CollectionViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? ComingSoonViewController {
            viewController.showDetail(atItem: item)
        }
    }
    
}

class InTheatersTapResponder: CollectionViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? InTheatersViewController {
            viewController.showDetail(atItem: item)
        }
    }
    
}

class TopRatedTapResponder: CollectionViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? TopRatedViewController {
            viewController.showDetail(atItem: item)
        }
    }
    
}
