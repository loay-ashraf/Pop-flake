//
//  HomePagerViewDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class MostPopularDelegate: PagerViewDelegate {
    
    var viewController: MostPopularViewController
    
    init(_ viewController: MostPopularViewController) {
        self.viewController = viewController
        super.init()
        tapResponder = MostPopularTapResponder(viewController)
        mediaHandler = MostPopularMediaHandler(viewController)
    }
    
}
