//
//  InTheatersDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class InTheatersDelegate: CollectionViewDelegate {
    
    init(_ viewController: InTheatersViewController) {
        super.init()
        tapResponder = InTheatersTapResponder(viewController)
    }
    
}
