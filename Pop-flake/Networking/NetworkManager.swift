//
//  NetworkManager.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation

class NetworkManager {
    
    // MARK: - Properties
    
    static let standard = NetworkManager()
    var isInternetConnected: Bool { return reachabilityHelper.isInternetConnected }
    
    private let urlSession: URLSession!
    private let reachabilityHelper: ReachabilityHelper!
    
    // MARK: - Initialization
    
    private init() {
        let urlSessionConfiguration = URLSessionConfiguration.default
        urlSessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad
        urlSession = URLSession(configuration: urlSessionConfiguration)
        reachabilityHelper = ReachabilityHelper()
    }
    
    // MARK: - Basic Request Methods
    
    func request(_ convertible: URLRequestConvertible, completionHandler: @escaping (NetworkError?) -> Void) {
        urlSession.dataTask(with: convertible.asURLRequest(), completionHandler: completionHandler).resume()
    }
    
    func request<Response: Decodable>(_ convertible: URLRequestConvertible, completionHandler: @escaping (ResponseResult<Response>) -> Void) {
        urlSession.dataTask(with: convertible.asURLRequest()) { dataResult in
            completionHandler(self.decodeDataResult(dataResult))
        }.resume()
    }
    
    // MARK: - Download Methods
    
    func download(url: URL, completionHandler: @escaping (DataResult) -> Void) -> URLSessionDataTask {
            let request = composeRequest(url: url, method: .GET)
            let task = urlSession.dataTask(with: request, completionHandler: completionHandler)
            task.resume()
            return task
    }

}

extension NetworkManager {
    
    // MARK: - Request Helper Methods

    private func composeRequest(url: URL, method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        return request
    }
    
    // MARK: - Result Mapping Helper Methods
    
    private func decodeDataResult<Response: Decodable>(_ dataResult: DataResult) -> Result<Response,NetworkError> {
        return dataResult.flatMap { (data) -> Result<Response,NetworkError> in
            do {
                let responseObject = try JSONDecoder().decode(Response.self, from: data)
                return .success(responseObject)
            } catch {
                do {
                    let errorObject = try JSONDecoder().decode(APIError.self, from: data)
                    return .failure(.api(errorObject))
                } catch { return .failure(.decoding(error)) }
            }
        }
    }
    
}

