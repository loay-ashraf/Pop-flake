//
//  HomeCollectionViewCellConfigurator.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class FullMovieCellConfigurator: CollectionViewCellConfigurator {
    
    override func configure<T: CollectionCellViewModel>(_ cell: UICollectionViewCell, forDisplaying item: T) {
        if let cell = cell as? FullMovieCell, let item = item as? FullMovieCellViewModel {
            cell.titleLabel.text = item.title
            cell.ratingLabel.text = item.rating
            cell.ratingCountLabel.text = item.ratingCount
            cell.yearLabel.text = item.year
            cell.contentRatingLabel.text = item.contentRating
            cell.runtimeLabel.text = item.runtimeString
            cell.posterImageView.load(at: item.image)
            cell.setNeedsLayout()
        }
    }
    
}

class CompactMovieCellConfigurator: CollectionViewCellConfigurator {
    
    override func configure<T: CollectionCellViewModel>(_ cell: UICollectionViewCell, forDisplaying item: T) {
        if let cell = cell as? CompactMovieCell, let item = item as? CompactMovieCellViewModel {
            cell.titleLabel.text = item.title
            cell.yearLabel.text = item.year
            cell.ratingLabel.text = item.rating
            cell.posterImageView.load(at: item.image)
            cell.setNeedsLayout()
        }
    }
    
}
