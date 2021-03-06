//
//  ImageLoader.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation
import UIKit

class ImageLoader {
    
    static let standard = ImageLoader()
    
    private let networkManager = NetworkManager.standard
    private var cache: NSCache<NSURL,UIImage>!
    private var runningRequests: [UUID:URLSessionDataTask]
    
    private init() {
        cache = NSCache()
        cache.countLimit = 70
        runningRequests = [UUID: URLSessionDataTask]()
    }
    
    func loadImage(_ url: URL, completion: @escaping (Result<UIImage,NetworkError>) -> Void) -> UUID? {
        if let image = cache.object(forKey: url as NSURL) {
            completion(.success(image))
            return nil
        }
        
        let taskUUID = UUID()
        
        let task = networkManager.download(url: url) { result in
            switch result {
            case .success(let data): if let image = UIImage(data: data) {
                                        self.cache.setObject(image, forKey: url as NSURL)
                                        completion(.success(image))
                                     }
            case .failure(let error): completion(.failure(error))
            }
        }
        
        runningRequests[taskUUID] = task
        
        return taskUUID
    }
    
    func cancelLoad(_ uuid: UUID) {
        runningRequests[uuid]?.cancel()
        runningRequests.removeValue(forKey: uuid)
    }
    
}
