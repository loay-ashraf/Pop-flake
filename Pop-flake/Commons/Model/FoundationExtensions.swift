//
//  FoundationExtensions.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

extension String {
    
    func appendPathComponent<T: StringProtocol>(_ component: T) -> String {
        return appending("/").appending(component)
    }
    
    func appendQueryComponent<T: StringProtocol>(_ component: T) -> String {
        return appending("+").appending(component)
    }
    
}

extension Mirror {
    
    func childValue(forLabel label: String) -> Any? {
        for child in children {
            if child.label == label {
                return child.value
            }
        }
        return nil
    }
    
}
