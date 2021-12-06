//
//  ASRouterInterface.swift
//  ASCore
//
//  Created by Andi Septiadi on 26/11/21.
//

import UIKit

public enum ASPresentType {
    case push
    case present
}

public protocol ASRouterInterface: AnyObject {}

public extension ASRouterInterface {
    
    func getTopController(
        parentViewController viewController: UIViewController? = UIApplication.as_rootViewController()
    ) -> UIViewController? {
        if let navController = viewController as? UINavigationController {
            return getTopController(parentViewController: navController.visibleViewController)
        }
        
        if let tabController = viewController as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return getTopController(parentViewController: selected)
            }
        }
        
        if let presented = viewController?.presentedViewController {
            return getTopController(parentViewController: presented)
        }
        
        return viewController
    }
    
    func present(viewController: UIViewController, presentType type: ASPresentType) {
        let topViewController = getTopController(parentViewController: UIApplication.as_rootViewController())
        let navigationController = topViewController?.navigationController
        
        switch type {
        case .push:
            navigationController?.pushViewController(viewController, animated: true)

        case .present:
            navigationController?.present(viewController, animated: true, completion: nil)
        }
    }
}

public extension UIApplication {
    class func as_currentWindow() -> UIWindow? {
        for scene in UIApplication.shared.connectedScenes
        where scene.activationState == .foregroundActive {
            if let windows = (scene as? UIWindowScene)?.windows {
                return windows.filter({ $0.isKeyWindow }).first
            }
        }
        return nil
    }
    
    class func as_rootViewController() -> UIViewController? {
        UIApplication.as_currentWindow()?.rootViewController
    }
}
