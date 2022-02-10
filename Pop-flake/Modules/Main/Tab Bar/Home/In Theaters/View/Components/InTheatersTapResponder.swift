//
//  InTheatersTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class InTheatersTapResponder: CollectionViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? InTheatersViewController {
            viewController.showDetail(atItem: item)
        }
    }
    
}
