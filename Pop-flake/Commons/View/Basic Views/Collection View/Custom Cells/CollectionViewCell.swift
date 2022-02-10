//
//  CollectionViewCell.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
 
    class var reuseIdentifier: String { return String(describing: CollectionViewCell.self) }
    class var nib: UINib? { return UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil) }
    
}
