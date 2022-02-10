//
//  BoxOfficeDelegate.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class BoxOfficeDelegate: TableViewDelegate {
    
    init(_ viewController: BoxOfficeViewController) {
        super.init()
        tapResponder = BoxOfficeTapResponder(viewController)
    }
    
}
