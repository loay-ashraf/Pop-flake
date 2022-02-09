//
//  NetworkProtocols.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

protocol WebServiceProvider {
    
    var networkManager: NetworkManager { get }
    
    init()
    
}

extension WebServiceProvider {
    
    // MARK: - Properties
    
    var networkManager: NetworkManager { return NetworkManager.standard }
    
    // MARK: - Initializer
    
    init() {
        self.init()
    }
    
}

protocol URLRequestConvertible {
    
    func asURLRequest() -> URLRequest
    
}
