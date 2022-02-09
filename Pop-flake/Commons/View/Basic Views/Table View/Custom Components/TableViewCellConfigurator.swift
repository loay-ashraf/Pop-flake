//
//  TableViewCellConfigurator.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class TableViewCellConfigurator {
    
    func configure<T: TableCellViewModel>(_ cell: UITableViewCell, forDisplaying item: T) { /* override this method in sub classes */ }
    
}
