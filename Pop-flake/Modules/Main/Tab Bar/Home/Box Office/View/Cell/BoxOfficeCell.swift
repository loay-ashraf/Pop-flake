//
//  BoxOfficeCell.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class BoxOfficeCell: TableViewCell, InterfaceBuilderTableViewCell {

    override class var reuseIdentifier: String { return String(describing: BoxOfficeCell.self) }
    override class var nib: UINib { return UINib(nibName: String(describing: BoxOfficeCell.self), bundle: nil) }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var grossLabel: UILabel!
    @IBOutlet weak var posterImageView: SFImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        grossLabel.text = nil
        posterImageView.image = nil
        posterImageView.cancel()
    }
    
}
