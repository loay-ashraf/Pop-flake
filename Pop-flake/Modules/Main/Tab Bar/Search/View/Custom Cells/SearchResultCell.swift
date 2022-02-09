//
//  SearchResultCell.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class SearchResultCell: TableViewCell, InterfaceBuilderTableViewCell {

    override class var reuseIdentifier: String { return String(describing: SearchResultCell.self) }
    override class var nib: UINib { return UINib(nibName: String(describing: SearchResultCell.self), bundle: nil) }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImageView: SFImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
        posterImageView.image = nil
        posterImageView.cancel()
    }
    
}
