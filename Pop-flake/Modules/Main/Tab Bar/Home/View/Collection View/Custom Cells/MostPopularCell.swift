//
//  MostPopularCell.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class MostPopularCell: CollectionViewCell, InterfaceBuilderCollectionViewCell {

    override class var reuseIdentifier: String { return String(describing: MostPopularCell.self) }
    override class var nib: UINib { return UINib(nibName: String(describing: MostPopularCell.self), bundle: nil) }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var posterImageView: SFImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        ratingLabel.text = nil
        posterImageView.image = nil
        posterImageView.cancel()
    }

}
