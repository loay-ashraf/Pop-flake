//
//  PagerViewDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView

class PagerViewDelegate: NSObject, FSPagerViewDelegate {
    
    weak var pagerView: PagerView?
    var tapResponder: PagerViewTapResponder?
    var mediaHandler: PagerViewMediaHandler?
    
    // MARK: - Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        self.pagerView?.deselectItem(at: index, animated: true)
        tapResponder?.respondToTap(atItem: index)
    }
    
}
