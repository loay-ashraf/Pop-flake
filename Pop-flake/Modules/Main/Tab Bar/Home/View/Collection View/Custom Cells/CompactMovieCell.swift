//
//  CompactMovieCell.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class CompactMovieCell: CollectionViewCell, InterfaceBuilderCollectionViewCell {

    override class var reuseIdentifier: String { return String(describing: CompactMovieCell.self) }
    override class var nib: UINib { return UINib(nibName: String(describing: CompactMovieCell.self), bundle: nil) }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var posterImageView: SFImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        ratingLabel.text = nil
        ratingCountLabel.text = nil
        yearLabel.text = nil
        posterImageView.image = nil
        posterImageView.cancel()
    }

}
