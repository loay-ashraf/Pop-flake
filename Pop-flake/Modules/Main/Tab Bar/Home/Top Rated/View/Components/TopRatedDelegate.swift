//
//  TopRatedDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class TopRatedDelegate: CollectionViewDelegate {
    
    init(_ viewController: TopRatedViewController) {
        super.init()
        tapResponder = TopRatedTapResponder(viewController)
    }
    
}
