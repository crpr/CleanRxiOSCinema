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

class ApiContainer {
    
    fileprivate static let container = Container();
    
    static func setup() {
        container.register(MoyaProvider<ConfigurationService>.self) { _ in
            MoyaProvider<ConfigurationService>()
        }
        
        container.register(ConfigurationManager.self) { _ in
            ConfigurationManager(provider: container.resolve(MoyaProvider<ConfigurationService>.self)!);
        }

        
        container.register(GetConfigurationProcess.self) { _ in
            GetConfigurationProcess(manager: container.resolve(ConfigurationManager.self)!);
        }
    }
    
    static func getResolver() -> Container {
        return container;
    }
}
