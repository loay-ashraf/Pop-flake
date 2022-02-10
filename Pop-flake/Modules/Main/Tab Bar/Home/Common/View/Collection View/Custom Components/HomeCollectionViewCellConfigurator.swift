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
            if item.rating.isEmpty {
                cell.ratingStackView.isHidden = true
            } else {
                cell.ratingLabel.text = item.rating
            }
            if item.ratingCount.isEmpty {
                cell.ratingCountStackView.isHidden = true
            } else {
                cell.ratingCountLabel.text = item.rating
            }
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
            if item.rating.isEmpty {
                cell.ratingStackView.isHidden = true
            } else {
                cell.ratingLabel.text = item.rating
            }
            if item.ratingCount.isEmpty {
                cell.ratingCountStackView.isHidden = true
            } else {
                cell.ratingCountLabel.text = item.rating
            }
            cell.posterImageView.load(at: item.image)
            cell.setNeedsLayout()
        }
    }
    
}
