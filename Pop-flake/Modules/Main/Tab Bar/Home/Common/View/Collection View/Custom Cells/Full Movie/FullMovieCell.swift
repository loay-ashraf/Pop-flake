//
//  FullMovieCell.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit
import SkeletonView

class FullMovieCell: CollectionViewCell, InterfaceBuilderCollectionViewCell {

    override class var reuseIdentifier: String { return String(describing: FullMovieCell.self) }
    override class var nib: UINib { return UINib(nibName: String(describing: FullMovieCell.self), bundle: nil) }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingCountStackView: UIStackView!
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var contentRatingLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var posterImageView: SFImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        ratingLabel.text = nil
        ratingStackView.isHidden = false
        ratingCountLabel.text = nil
        ratingCountStackView.isHidden = false
        yearLabel.text = nil
        contentRatingLabel.text = nil
        runtimeLabel.text = nil
        posterImageView.image = nil
        posterImageView.cancel()
    }

}
