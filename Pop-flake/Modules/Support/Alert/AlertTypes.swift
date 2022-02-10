//
//  AlertTypes.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation
import NotificationBannerSwift

enum Alert {
    
    case noInternet

    var controller: UIAlertController {
        return UIAlertController()
    }
    
    var statusBarBanner: StatusBarNotificationBanner {
        switch self {
        case .noInternet: return AlertConstants.NoInternet.notificationBanner()
        }
    }
    
}
