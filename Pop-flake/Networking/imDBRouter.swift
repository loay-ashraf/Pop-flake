//
//  imDBRouter.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

typealias Headers = [String:String]
typealias Parameters = [String:String]

enum imDBRouter {
    
    // MARK: - imDB API Route cases
    
    case trailer(id: String)
    case mostPopular
    case comingSoon
    case inTheaters
    case topRated
    case boxOffice
    case searchMovies(query: String)
    case searchSeries(query: String)
    
}

extension imDBRouter {
    
    // MARK: - Base URL Property
    
    var baseURL: String { return NetworkingConstants.apiBaseUrl }
    
    // MARK: - Path Property
    
    var path: String {
        
        switch self {
        case .trailer(let id): return baseURL.appendPathComponent(NetworkingConstants.apiKey).appendPathComponent(id)
        case .mostPopular: return baseURL.appendPathComponent(NetworkingConstants.mostPopular).appendPathComponent(NetworkingConstants.apiKey)
        case .comingSoon: return baseURL.appendPathComponent(NetworkingConstants.comingSoon).appendPathComponent(NetworkingConstants.apiKey)
        case .inTheaters: return baseURL.appendPathComponent(NetworkingConstants.inTheaters).appendPathComponent(NetworkingConstants.apiKey)
        case .topRated: return baseURL.appendPathComponent(NetworkingConstants.topRated).appendPathComponent(NetworkingConstants.apiKey)
        case .boxOffice: return baseURL.appendPathComponent(NetworkingConstants.boxOffice).appendPathComponent(NetworkingConstants.apiKey)
        case .searchMovies(let query): return baseURL.appendPathComponent(NetworkingConstants.searchMovies).appendPathComponent(NetworkingConstants.apiKey).appendPathComponent(query)
        case .searchSeries(let query): return baseURL.appendPathComponent(NetworkingConstants.searchSeries).appendPathComponent(NetworkingConstants.apiKey).appendPathComponent(query)
        }
        
    }
    
    // MARK: - Method Property
    
    var method: HTTPMethod { return .GET }
    
    // MARK: - Headers Property
    
    var headers: Headers { return ["Content-Type":"application/json"] }
    
    // MARK: - Parameters Property
    
    var parameters: Parameters { return [:] }
        
}

// MARK: - URL Request Convertible Protocol

extension imDBRouter: URLRequestConvertible {
    
    func asURLRequest() -> URLRequest {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.setQueryItems(with: parameters)
        let url = urlComponents?.url
        
        var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
        
        urlRequest.method = method
        urlRequest.headers = headers
        
        return urlRequest
    }
    
}
