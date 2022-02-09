//
//  TableViewTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class TableViewTapResponder {
    
    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func respondToTap(atRow row: Int) { /* override this method in sub classes */ }
    
}
