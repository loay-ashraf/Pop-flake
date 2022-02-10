//
//  SearchDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class SearchResultDelegate: TableViewDelegate {
    
    init(_ viewController: MovieSearchViewController) {
        super.init()
        tapResponder = SearchResultTapResponder(viewController)
    }
    
    init(_ viewController: SeriesSearchViewController) {
        super.init()
        tapResponder = SearchResultTapResponder(viewController)
    }
    
}
