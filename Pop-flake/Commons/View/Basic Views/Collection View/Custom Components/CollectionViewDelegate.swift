//
//  CollectionViewDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    weak var collectionView: CollectionView?
    var tapResponder: CollectionViewTapResponder?
    var scrollViewAction: (() -> Void)?
    
    // MARK: - Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        tapResponder?.respondToTap(atItem: indexPath.row)
    }
    
    // MARK: - Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewAction?()
    }

}
