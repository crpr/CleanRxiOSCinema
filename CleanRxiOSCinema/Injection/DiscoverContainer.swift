//
//  DiscoverContainer.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 10/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import Swinject
import Moya
import RxSwift

class DiscoverContainer {
    
    fileprivate static let container = Container();
    
    static func setup() {
        
        container.register(MoyaProvider<DiscoverService>.self) { _ in
            MoyaProvider<DiscoverService>()
        }
        
        container.register(DiscoverManagerProtocol.self) { _ in
            DiscoverManager(provider: container.resolve(MoyaProvider<DiscoverService>.self)!);
        }
        
        container.register(ApiMovieListConverter.self) { _ in
            ApiMovieListConverter();
        }
        
        container.register(DiscoverProcessProtocol.self) { _ in
            DiscoverProcess(manager: container.resolve(DiscoverManagerProtocol.self)!,
                            converter: container.resolve(ApiMovieListConverter.self)!);
        }
        
        container.register(DiscoverInteractorProtocol.self) { _ in
            DiscoverInteractor(mainThread: MainScheduler.instance,
                             backgroundThread: .background,
                             process: container.resolve(DiscoverProcessProtocol.self)!)
        }
        
        container.register(DiscoverPresenterProtocol.self){ _ in
            DiscoverPresenter(interactor: container.resolve(DiscoverInteractorProtocol.self)!);
        }
        
        container.register(DiscoverNavigatorProtocol.self){ _ in
            DiscoverNavigator();
        }
        
        container.register(DiscoverViewProtocol.self) { _ in
            let controller = DiscoverViewController();
            controller.presenter = container.resolve(DiscoverPresenterProtocol.self)!;
            controller.navigator = container.resolve(DiscoverNavigatorProtocol.self)!;
            return controller;
        }
        
    }
    
    static func getResolver() -> Container {
        return container;
    }
}
