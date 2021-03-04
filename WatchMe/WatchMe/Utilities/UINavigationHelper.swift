//
//  UINavigationHelper.swift
//  WatchMe
//
//  Created by  Sreekanth on 26/2/21.
//

import UIKit
// MARK: - UIViewController Extension

extension UIViewController {
  // Extension Method to get Top most ViewController
  func topmostViewController() -> UIViewController {
    if let navigationVC = self as? UINavigationController,
      let topVC = navigationVC.topViewController {
      return topVC.topmostViewController()
    }
    if let tabBarVC = self as? UITabBarController,
      let selectedVC = tabBarVC.selectedViewController {
      return selectedVC.topmostViewController()
    }
    if let presentedVC = presentedViewController {
      return presentedVC.topmostViewController()
    }
    if let childVC = children.last {
      return childVC.topmostViewController()
    }
    return self
  }
  
    func showSpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    func removeSpinner(childView: UIView) {
        DispatchQueue.main.async {
            childView.removeFromSuperview()
            
        }
    }
}

extension UIApplication {
  func topmostViewController() -> UIViewController? {
    return keyWindow?.rootViewController?.topmostViewController()
  }
}
extension UIView {
    public func removeAllSubviewsAndRemoveFromSuperview() {
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }

        removeFromSuperview()
    }

    public func removeAllSubviews() {
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
    }
}
