//
//  UINavigationController+QSUAdditions.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import UIKit

public extension UINavigationController {
  func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> ()) {
    pushViewController(viewController, animated: animated)
    
    if let coordinator = transitionCoordinator, animated {
      coordinator.animate(alongsideTransition: nil) { _ in
        completion()
      }
    } else {
      completion()
    }
  }
  
  func popViewController(animated: Bool, completion: @escaping () -> ()) {
    popViewController(animated: animated)
    
    if let coordinator = transitionCoordinator, animated {
      coordinator.animate(alongsideTransition: nil) { _ in
        completion()
      }
    } else {
      completion()
    }
  }
}
