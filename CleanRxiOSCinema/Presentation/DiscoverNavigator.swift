//
//  DiscoverNavigator.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 11/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import QuickShotUtils

public enum DiscoverRoute {
    case details
}

protocol  DiscoverNavigatorProtocol {
    func navigateToNextScreen(destination: DiscoverRoute?, transitionType: ViewControllerPresentationType?);
}

class DiscoverNavigator: DiscoverNavigatorProtocol {
    
    func navigateToNextScreen(destination: DiscoverRoute?, transitionType: ViewControllerPresentationType?) {
        
    }
    
}
