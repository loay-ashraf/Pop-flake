//
//  NetworkProtocols.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

protocol URLRequestConvertible {
    
    func asURLRequest() -> URLRequest
    
}