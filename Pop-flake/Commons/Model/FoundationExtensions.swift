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

extension Dictionary where Key: StringProtocol, Value: StringProtocol {
    
    var queryString: String {
        return map { $0.key + ":" + $0.value }.joined(separator: "+")
    }
    
}
