//
//  ApiMovie.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 10/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import ObjectMapper

struct ApiMovie: Mappable {
    
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_path: String?
    var original_title: String?
    var overview: String?
    var release_date: String?
    var poster_path: String?
    var popularity: Double?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    
}

extension ApiMovie {
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        genre_ids <- map["genre_ids"]
        id <- map["id"]
        original_path <- map["original_path"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        release_date <- map["release_date"]
        poster_path <- map["poster_path"]
        popularity <- map["popularity"]
        title <- map["title"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
}
