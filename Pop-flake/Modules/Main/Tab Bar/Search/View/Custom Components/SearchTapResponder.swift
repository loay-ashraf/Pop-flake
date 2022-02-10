//
//  SearchTapResponder.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class SearchResultTapResponder: TableViewTapResponder {
    
    override func respondToTap(atRow row: Int) {
        if let viewController = viewController as? MovieSearchViewController {
            viewController.showDetail(atRow: row)
        } else if let viewController = viewController as? SeriesSearchViewController {
            viewController.showDetail(atRow: row)
        }
    }
    
}
