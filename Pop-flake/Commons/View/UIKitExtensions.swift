//
//  UIKitExtensions.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import UIKit

extension UIApplication {

    class func keyWindow() -> UIWindow? {
        return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.keyWindow()?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let searchController = controller as? UISearchController {
            if let resultsController = searchController.searchResultsController {
                return topViewController(controller: resultsController)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        if let alert = controller as? UIAlertController {
            if let navigationController = alert.presentingViewController as? UINavigationController {
                return navigationController.viewControllers.last
            }
            return alert.presentingViewController
        }
        return controller
    }
    
    class func topNavigationController() -> UINavigationController? {
        return topViewController()?.navigationController
    }

}

extension UIView {
    
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    var cornerCurve: CALayerCornerCurve {
        get { return layer.cornerCurve }
        set { layer.cornerCurve = newValue }
    }
    
    var masksToBounds: Bool {
        get { return layer.masksToBounds }
        set { layer.masksToBounds = newValue }
    }
    
}
