//
//  GetConfigurationProcess.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

struct GetConfigurationProcess {
    let manager: ConfigurationManager;
    
    init(manager: ConfigurationManager) {
        self.manager = manager;
    }
}

extension GetConfigurationProcess {
    
    func getConfiguration() -> Observable<Result> {
        return manager.configuration()
            .flatMap { config -> Observable<Result> in
                self.configureImageUrlProvider(config: config);
        }
    }
    
    fileprivate func configureImageUrlProvider(config: ApiConfigurationResponse) -> Observable<Result> {
        
        if config.images_configuration == nil {
            return Observable.just(Result(statusCode: .error));
        }
        
        let configurationModel = ConfigurationModelBuilder()
                                    .Init()
                                    .withBaseUrl(url: (config.images_configuration?.base_url)!)
                                    .withSecureBaseUrl(url: (config.images_configuration?.secure_base_url)!)
                                    .build();
        
        ImageUrlProvider.sharedInstance.setCurrentConfig(model: configurationModel);
        
        return Observable.just(Result(statusCode: .ok));
    }
    
}
