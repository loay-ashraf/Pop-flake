//
//  NetworkExtensions.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

extension URLSession {
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (NetworkError?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completionHandler(NetworkError(response: response, error: error))
            }
        }
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (DataResult) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: request) { data, response, error in
            if let networkError = NetworkError(data: data, response: response, error: error) {
                DispatchQueue.main.async {
                    completionHandler(.failure(networkError))
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(.success(data!))
            }
        }
    }
    
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String:String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
}

extension URLRequest {
    
    var method: HTTPMethod? {
        get { return HTTPMethod(rawValue: httpMethod) }
        set { httpMethod = newValue?.rawValue }
    }
    
    var headers: [String:String]? {
        get { return allHTTPHeaderFields }
        set { allHTTPHeaderFields = newValue }
    }
    
}
