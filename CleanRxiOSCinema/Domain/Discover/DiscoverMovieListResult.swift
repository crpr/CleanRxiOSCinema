//
//  DiscoverMovieListResult.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 11/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation

class DiscoverMovieListResult: Result {
    
    var models: [ListMovieModel]?
    
    init(statusCode: ResultStatus, movies: [ListMovieModel]) {
        super.init(statusCode: statusCode);
        self.models = movies;
    }
}
