//
//  ComingSoonDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class ComingSoonDelegate: CollectionViewDelegate {
    
    init(_ viewController: ComingSoonViewController) {
        super.init()
        tapResponder = ComingSoonTapResponder(viewController)
    }
    
}
