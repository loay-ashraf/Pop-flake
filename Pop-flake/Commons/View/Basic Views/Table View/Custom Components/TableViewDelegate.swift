//
//  TableViewDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var tableView: TableView?
    var tapResponder: TableViewTapResponder?
    var scrollViewAction: (() -> Void)?
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tapResponder?.respondToTap(atRow: indexPath.row)
    }
    
    // MARK: - Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewAction?()
    }
    
}
