//
//  PagerViewCell.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView

class PagerViewCell: FSPagerViewCell {
 
    class var reuseIdentifier: String { return String(describing: PagerViewCell.self) }
    class var nib: UINib? { return UINib(nibName: String(describing: PagerViewCell.self), bundle: nil) }
    
}
