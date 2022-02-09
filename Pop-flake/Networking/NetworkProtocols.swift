//
//  NetworkProtocols.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

protocol WebServiceProvider {
    
    var networkManager: NetworkManager { get }
    
}

extension WebServiceProvider {
    
    var networkManager: NetworkManager { return NetworkManager.standard }
    
}

protocol URLRequestConvertible {
    
    func asURLRequest() -> URLRequest
    
}
