//
//  HomePagerViewCellConfigurator.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class MostPopularCellConfigurator: PagerViewCellConfigurator {
    
    override func configure<T: CollectionCellViewModel>(_ cell: PagerViewCell, forDisplaying item: T) {
        if let cell = cell as? MostPopularCell, let item = item as? MostPopularCellViewModel {
            cell.titleLabel.text = item.title
            cell.ratingLabel.text = item.rating
            cell.posterImageView.load(at: item.image)
            cell.setNeedsLayout()
        }
    }
    
}
