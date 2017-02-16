//
//  ApiResponse.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 10/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiResponse<T: Mappable> : Mappable {
    
    var page: Int?;
    var total_pages: Int?;
    var total_results: Int?;
    var results: [T]?;
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        page <- map["page"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
        results <- map["results"]
    }
    
}
