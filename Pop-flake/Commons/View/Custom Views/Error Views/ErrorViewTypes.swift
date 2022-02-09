//
//  ErrorViewTypes.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

struct ErrorViewModel {
    
    var image: UIImage?
    var title: String
    var message: String
    
    init(image: UIImage?, title: String, message: String) {
        self.image = image
        self.title = title
        self.message = message
    }
    
    init?(from error: Error) {
        typealias errorConstants = Constants.View.Error
        if let networkError = error as? NetworkError {
            switch networkError {
            case .noResponse,.noData: self = ErrorConstants.Internet.viewModel
            case .client(let clientError): if (clientError as NSError).code == NSURLErrorNotConnectedToInternet {
                self = ErrorConstants.Internet.viewModel
            } else {
                self = ErrorConstants.Network.viewModel
            }
            case .server,.api,.decoding,.encoding: self = ErrorConstants.Network.viewModel
            }
        }
        return nil
    }
    
}
