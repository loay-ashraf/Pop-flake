//
//  BoxOfficeCellConfigurator.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class BoxOfficeCellConfigurator: TableViewCellConfigurator {
    
    override func configure<T: TableCellViewModel>(_ cell: UITableViewCell, forDisplaying item: T) {
        if let cell = cell as? BoxOfficeCell, let item = item as? BoxOfficeCellViewModel {
            cell.titleLabel.text = item.title
            cell.grossLabel.text = item.gross
            cell.posterImageView.load(at: item.image)
            cell.setNeedsLayout()
        }
    }
    
}
