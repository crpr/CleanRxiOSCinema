//
//  QSUBaseViewController.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation
import UIKit

public enum ViewControllerPresentationType: String {
  case PushStack, Modal, ReplaceNavigation, ReplaceAtRoot
}

open class QSUBaseViewController: UIViewController
{
  
  // MARK: Object lifecycle
  public init(_ coder: NSCoder? = nil) {
    if let coder = coder {
      super.init(coder: coder)!
    } else {
      super.init(nibName: nil, bundle:nil)
    }
  }
  
  required convenience public init(coder: NSCoder) {
    self.init(coder)
  }
  
  //MARK: ViewController common variables

  
  // MARK: View lifecycle
  
  override open func viewDidLoad() {
    super.viewDidLoad()
  }
  
  public func setNavBarTitle(title : String) {
    let navBar = navigationController?.navigationBar;
    if(navBar != nil){
      navBar!.topItem!.title = title
    }
  }
  
  public func hideNavigationBar(hide : Bool) {
    let navBar = navigationController?.navigationBar;
    if navBar != nil {
      navBar!.isHidden = hide
    }
  }
  
  
  public func hideNavigationBackButtonTitle() {
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
  }
  
  
  //MARK: Event Handling
  
  
  //MARK: Base navigation actions
  public func transtitionToNextViewController(fromViewController: UIViewController, destinationViewController: UIViewController?, transitionType: ViewControllerPresentationType?){
    if transitionType != nil && destinationViewController != nil {
      //(destinationViewController as! RFBaseViewController).menuDelegate = (fromViewController as! RFBaseViewController).menuDelegate;
      
      switch(transitionType!){
      case .PushStack:
        let navigationController = fromViewController.navigationController;
        navigationController?.pushViewController(destinationViewController!, animated: true);
        break;
      case .Modal:
        fromViewController.present(destinationViewController!, animated: true, completion: nil)
        break;
      case .ReplaceNavigation:
        let newNavigationController = UINavigationController(rootViewController: destinationViewController!);
        
        let appWindow = UIApplication.shared.delegate?.window!
        //animate swapping with nice transition
        UIView.transition(with: appWindow!, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
          appWindow!.rootViewController = newNavigationController
          }, completion: nil);
        break
      case .ReplaceAtRoot:
        let appWindow = UIApplication.shared.delegate?.window!
        //animate swapping with nice transition
        UIView.transition(with: appWindow!, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
          appWindow!.rootViewController = destinationViewController
          }, completion: nil);
        break;
      }
    }
  }
  
  public func showProgressIndicator(){
    //old version
    //    RFProgressIndicatorView.show("", animated: true);
    QSUBasicLoadingIndicator.shared.show();
  }
  
  public func showProgressIndicatorWithText(indicatorText: String, animated: Bool){
    //old version
    //    RFProgressIndicatorView.show(indicatorText, animated: animated);
    QSUBasicLoadingIndicator.shared.show();
  }
  
  public func hideProgressIndicator(){
    //old version
    //    RFProgressIndicatorView.hide();
    QSUBasicLoadingIndicator.shared.hide();
  }
  
  var backgroundImage: UIImageView?;
  public func setBackgroundView(imageName: String){
    //setup background
    let screenSize: CGRect = UIScreen.main.bounds
    
    backgroundImage = UIImageView(frame: screenSize);
    //    backgroundImage?.image = UIImage(named: imageName);
    
    if(screenSize.height >= 568){
      let deviceImgName = imageName + "-iphone6";
      backgroundImage?.image = UIImage(named: deviceImgName);
      
      if(backgroundImage!.image == nil){
        backgroundImage!.image = UIImage(named: imageName);
      }
    }else{
      backgroundImage!.image = UIImage(named: imageName);
    }
    //    backgroundImage!.translatesAutoresizingMaskIntoConstraints = false
    self.view.insertSubview(backgroundImage!, at: 0);
  }
  
  public func doOpenURLIfPossible(urlToOpen: URL?){
    if let url: URL = urlToOpen {
      if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.openURL(url);
      }
    }
  }
  
  public func doNothing() {
    /// selector used to do nothing :)
  }
  
  public func hideNavigationBarSeparator(){
    if(self.navigationController != nil){
      for parent in self.navigationController!.navigationBar.subviews {
        for childView in parent.subviews {
          if(childView is UIImageView && childView.height == 0.5) { //thor counter increase per design request
            childView.removeFromSuperview()
          }
        }
      }
    }
  }
}
