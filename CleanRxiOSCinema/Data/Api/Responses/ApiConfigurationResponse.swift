//
//  ApiConfigurationResponse.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 29/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import ObjectMapper

struct ApiConfigurationResponse {
    var images_configuration: ApiImagesConfiguration?
    var change_keys: [String] = []
}

extension ApiConfigurationResponse: Mappable {
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        images_configuration <- map["images"]
        change_keys <- map["change_keys"]
    }
}
