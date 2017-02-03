//
//  QSUBasicLoadingIndicator.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import UIKit

public class QSUBasicLoadingIndicator{
  
  var overlayView: UIView?;
  var activityIndicator: UIActivityIndicatorView?;
  
  class var shared: QSUBasicLoadingIndicator {
    struct Static {
      static let instance: QSUBasicLoadingIndicator = QSUBasicLoadingIndicator()
    }
    return Static.instance
  }
  
  private init(){
    let window = UIApplication.shared.windows.first!
    overlayView = UIView(frame: window.frame);
    overlayView?.backgroundColor = UIColor.black.withAlphaComponent(0.8);
    overlayView?.clipsToBounds = true
    
    activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    activityIndicator?.activityIndicatorViewStyle = .whiteLarge
    activityIndicator?.centerX = window.frame.size.width/2
    activityIndicator?.centerY = window.frame.size.height/2
    activityIndicator?.color = UIColor.white;
    
    overlayView!.addSubview(activityIndicator!)
  }
  
  
  
  public func show() {
    //without animations
    //    let window = UIApplication.sharedApplication().windows.first!
    //    window.addSubview(overlayView!)
    //    activityIndicator!.startAnimating()
    
    //with animations
    let window = UIApplication.shared.windows.first
    window?.addSubview(self.overlayView!)
    self.activityIndicator!.startAnimating()
    
    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
      self.overlayView!.alpha = 0.8
      }, completion: { finished in
    })
  }
  
  public func hide() {
    //without animations
    //    activityIndicator!.stopAnimating()
    //    overlayView!.removeFromSuperview()
    
    //with animations
    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
      self.overlayView!.alpha = 0.0
      }, completion: { finished in
        self.activityIndicator!.stopAnimating()
        self.overlayView!.removeFromSuperview()
    })
  }
}
