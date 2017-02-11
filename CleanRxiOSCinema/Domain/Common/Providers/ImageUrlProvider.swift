//
//  ImageUrlProvider.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation

class ImageUrlProvider {
    
    static let sharedInstance = ImageUrlProvider();
    
    fileprivate init() {
        self.model = ConfigurationModelBuilder().build();
    }
    
    fileprivate var model: ConfigurationModel;
    
    func setCurrentConfig(model: ConfigurationModel) {
        self.model = model;
    }
    
    func getUrlFor(size: ApiSize) -> String? {
        return self.model.baseUrl+size.rawValue;
    }
}
