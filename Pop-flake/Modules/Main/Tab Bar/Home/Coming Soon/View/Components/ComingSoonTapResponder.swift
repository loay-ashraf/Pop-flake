//
//  ComingSoonTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class ComingSoonTapResponder: CollectionViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? ComingSoonViewController {
            viewController.showDetail(atItem: item)
        }
    }
    
}
