//
//  PagerViewTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView

class PagerViewTapResponder {

    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func respondToTap(atItem item: Int) { /* override this method in sub classes */ }
    
}
