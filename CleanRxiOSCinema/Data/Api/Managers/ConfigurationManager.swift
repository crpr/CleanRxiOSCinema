//
//  ConfigurationManager.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 29/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

protocol ConfigurationManagerProtocol : BaseManagerProtocol {
    func configuration() -> Observable<ApiConfigurationResponse>;
}

class ConfigurationManager : BaseManager<ConfigurationService, ApiConfigurationResponse>, ConfigurationManagerProtocol {
}

extension ConfigurationManager {
    func configuration() -> Observable<ApiConfigurationResponse>{
        return requestObject(.configuration())
    }
}
