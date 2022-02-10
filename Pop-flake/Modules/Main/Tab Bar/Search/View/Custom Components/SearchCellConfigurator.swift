//
//  SearchCellConfigurator.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class SearchResultCellConfigurator: TableViewCellConfigurator {
    
    override func configure<T: TableCellViewModel>(_ cell: UITableViewCell, forDisplaying item: T) {
        if let cell = cell as? SearchResultCell, let item = item as? SearchResultCellViewModel {
            cell.titleLabel.text = item.title
            cell.descriptionLabel.text = item.description
            cell.posterImageView.load(at: item.image)
            cell.setNeedsLayout()
        }
    }
    
}
