//
//  HomeTableViewTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class BoxOfficeTapResponder: TableViewTapResponder {
    
    override func respondToTap(atRow row: Int) {
        if let viewController = viewController as? BoxOfficeViewController {
            viewController.showDetail(atRow: row)
        }
    }
    
}
