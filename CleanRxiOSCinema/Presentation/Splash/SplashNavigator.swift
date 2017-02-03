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
    func navigateToNextScreen(destination: SplashRoute?, transitionType: ViewControllerPresentationType?);
}

class SplashNavigator: SplashNavigatorProtocol {
    
    func navigateToNextScreen(destination: SplashRoute?, transitionType: ViewControllerPresentationType?) {
        
    }

}
