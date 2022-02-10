//
//  Constants.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Foundation
import UIKit

typealias NetworkingConstants = Constants.NetworkingConstants
typealias ViewConstants = Constants.View
typealias EmptyConstants = ViewConstants.Empty
typealias ErrorConstants = ViewConstants.Error

struct Constants {
    
    // MARK: - Networking Constants
    
    struct NetworkingConstants {
        
        static let apiBaseUrl = "https://imdb-api.com/API"
        
        static let mostPopular = "MostPopularMovies"
        static let comingSoon = "ComingSoon"
        static let inTheaters = "InTheaters"
        static let topRated = "Top250Movies"
        static let boxOffice = "BoxOffice"
        static let trailer = "YouTubeTrailer"
        static let searchMovies = "SearchMovie"
        static let searchSeries = "SearchSeries"
        
        static let apiKey = "k_b0u5794q"
        
        static let maxPageCount = 100
        static let minimumPageCapacity = 10
        
        static func titleURL(forID id: String) -> URL {
            return (URL(string: "www.imdb.com/title")?.appendingPathComponent(id))!
        }
        
    }
    
    // MARK: - View Constants
    
    struct View {
        
        // MARK: - Empty Constants
        
        struct Empty {
            
            // General empty image and title
            struct General {
                
                static private let image = UIImage(systemName: "exclamationmark")
                static private let title = "WoW, such empty"
                static let viewModel = EmptyViewModel(image: image, title: title)
                
            }
            
            // Search results image and title
            struct SearchResults {
                
                static private let image = UIImage(systemName: "magnifyingglass")
                static private let title = "No Search results found, try searching for a different term."
                static let viewModel = EmptyViewModel(image: image, title: title)
                
            }
            
        }
        
        // MARK: - Error Constants
        
        struct Error {
            
            // Internet error image, title and message
            struct Internet {
                
                static private let image = UIImage(systemName: "wifi.exclamationmark")
                static private let title = "No Internet"
                static private let message = "You're not connected to Internet,\nplease try again later."
                static let viewModel = ErrorViewModel(image: image, title: title, message: message)

            }
            
            // Network error image, title and message
            struct Network {
                
                static private let image = UIImage(systemName: "exclamationmark.icloud")
                static private let title = "Network Error"
                static private let message = "We're working on it,\nWe will be back soon."
                static let viewModel = ErrorViewModel(image: image, title: title, message: message)
                
            }
            
        }
        
    }
    
}
