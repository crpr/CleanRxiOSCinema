//
//  ConfigurationModel.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation

struct ConfigurationModel {
    var baseUrl: String
    var secureBaseUrl: String
    
    init() {
        self.baseUrl = "";
        self.secureBaseUrl = "";
    }
}

class ConfigurationModelBuilder {
    var model = ConfigurationModel();
    
    func Init() -> ConfigurationModelBuilder {
        model = ConfigurationModel();
        return self;
    }
    
    func withBaseUrl(url: String) -> ConfigurationModelBuilder {
        model.baseUrl = url;
        return self;
    }
    
    func withSecureBaseUrl(url: String) -> ConfigurationModelBuilder {
        model.secureBaseUrl = url;
        return self;
    }
    
    func build() -> ConfigurationModel {
        return model;
    }
}
