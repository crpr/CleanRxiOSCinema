//
//  ConfigurationContainer.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 03/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import Swinject
import Moya
import RxSwift

class ConfigurationContainer {
    
    fileprivate static let container = Container();
    
    static func setup() {
        
        container.register(MoyaProvider<ConfigurationService>.self) { _ in
            MoyaProvider<ConfigurationService>()
        }
        
        container.register(ConfigurationManagerProtocol.self) { _ in
            ConfigurationManager(provider: container.resolve(MoyaProvider<ConfigurationService>.self)!);
        }
        
        container.register(GetConfigurationProcessProtocol.self) { _ in
            GetConfigurationProcess(manager: container.resolve(ConfigurationManagerProtocol.self)!);
        }
        
    }
    
    static func getResolver() -> Container {
        return container;
    }
}
