//
//  SplashNavigator.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 26/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import UIKit
import QuickShotUtils

public enum SplashRoute {
    case onBoarding, home
}

protocol  SplashNavigatorProtocol {
    func navigateToNextScreen(viewController: QSUBaseViewController, destination: SplashRoute?, transitionType: ViewControllerPresentationType?);
}

class SplashNavigator: SplashNavigatorProtocol {
    
    func navigateToNextScreen(viewController: QSUBaseViewController, destination: SplashRoute?, transitionType: ViewControllerPresentationType?) {
        
        var destinationViewController: UIViewController? = nil
        
        if let dest = destination {
            switch(dest){
            case .home:
                destinationViewController = DiscoverContainer.getResolver().resolve(DiscoverViewProtocol.self) as? DiscoverViewController;
                break;
            default:
                break;
            }
        }
        
        guard destinationViewController != nil else {
            return
        }
        
        viewController.transtitionToNextViewController(fromViewController: viewController, destinationViewController: destinationViewController, transitionType: transitionType);
    }
}
