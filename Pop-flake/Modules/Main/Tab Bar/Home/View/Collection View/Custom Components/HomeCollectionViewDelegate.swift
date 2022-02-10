//
//  HomeCollectionViewDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class ComingSoonDelegate: CollectionViewDelegate {
    
    init(_ viewController: ComingSoonViewController) {
        super.init()
        tapResponder = ComingSoonTapResponder(viewController)
    }
    
}

class InTheatersDelegate: CollectionViewDelegate {
    
    init(_ viewController: InTheatersViewController) {
        super.init()
        tapResponder = InTheatersTapResponder(viewController)
    }
    
}

class TopRatedDelegate: CollectionViewDelegate {
    
    init(_ viewController: TopRatedViewController) {
        super.init()
        tapResponder = TopRatedTapResponder(viewController)
    }
    
}
