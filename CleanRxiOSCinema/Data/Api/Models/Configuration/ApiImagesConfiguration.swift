//
//  ApiImagesConfiguration.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 30/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import ObjectMapper

struct ApiImagesConfiguration {
    var base_url: String = ""
    var secure_base_url: String = ""
    var backdrop_sizes : [ApiSize] = []
    var logo_sizes : [ApiSize] = []
    var poster_sizes : [ApiSize] = []
    var profile_sizes : [ApiSize] = []
    var still_sizes : [ApiSize] = []
}

extension ApiImagesConfiguration: Mappable {
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        base_url <- map["base_url"]
        secure_base_url <- map["secure_base_url"]
        backdrop_sizes <- map["backdrop_sizes"]
        logo_sizes <- map["logo_sizes"]
        poster_sizes <- map["poster_sizes"]
        profile_sizes <- map["profile_sizes"]
        still_sizes <- map["still_sizes"]
    }
}
