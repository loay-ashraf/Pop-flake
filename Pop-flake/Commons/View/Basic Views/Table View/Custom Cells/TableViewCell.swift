//
//  TableViewCell.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
 
    class var reuseIdentifier: String { return String(describing: TableViewCell.self) }
    class var nib: UINib? { return UINib(nibName: String(describing: TableViewCell.self), bundle: nil) }
    
}
