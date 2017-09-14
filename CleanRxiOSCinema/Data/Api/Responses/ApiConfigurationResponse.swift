//
//  ApiConfigurationResponse.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 29/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import ObjectMapper

struct ApiConfigurationResponse : Mappable {
    
    var images_configuration: ApiImagesConfiguration?
    var change_keys: [String] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        images_configuration <- map["images"]
        change_keys <- map["change_keys"]
    }
    
}
