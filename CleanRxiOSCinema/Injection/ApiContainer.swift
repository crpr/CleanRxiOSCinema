//
//  ApiContainer.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import Swinject
import Moya
import RxSwift

class ApiContainer {
    
    fileprivate static let container = Container();
    
    static func setup() {
        
        container.register(SplashInteractorProtocol.self) { _ in
            SplashInteractor(mainThread: MainScheduler.instance,
                             backgroundThread: .background,
                             process: ConfigurationContainer.getResolver().resolve(GetConfigurationProcessProtocol.self)!)
        }
        
        container.register(SplashPresenterProtocol.self){ _ in
            SplashPresenter(interactor: container.resolve(SplashInteractorProtocol.self)!);
        }

        container.register(SplashNavigatorProtocol.self){ _ in
            SplashNavigator();
        }
        
        container.register(SplashViewProtocol.self) { _ in
            let controller = SplashViewController();
            controller.presenter = container.resolve(SplashPresenterProtocol.self)!;
            controller.navigator = container.resolve(SplashNavigatorProtocol.self)!;
            return controller;
            }
    }
    
    static func getResolver() -> Container {
        return container;
    }
}
