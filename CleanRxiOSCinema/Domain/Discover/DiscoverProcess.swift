//
//  DiscoverProcess.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 10/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

protocol DiscoverProcessProtocol {
    func discover() -> Observable<DiscoverMovieListResult>;
}

struct DiscoverProcess : DiscoverProcessProtocol {
    let manager: DiscoverManagerProtocol;
    let converter: ApiMovieListConverter;
    
    init(manager: DiscoverManagerProtocol, converter: ApiMovieListConverter) {
        self.manager = manager;
        self.converter = converter;
    }
}

extension DiscoverProcess {
    
    func discover() -> Observable<DiscoverMovieListResult> {
        return manager.discover()
            .flatMap { response -> Observable<DiscoverMovieListResult> in
                self.processResponse(response: response);
        }
    }
    
    fileprivate func processResponse(response: ApiResponse<ApiMovie>) -> Observable<DiscoverMovieListResult> {
        return Observable.just(convert(response: response))
    }
    
    fileprivate func convert(response: ApiResponse<ApiMovie>) -> DiscoverMovieListResult {
        
        var movies = [ListMovieModel]();
        
        if response.results != nil {
            movies = response.results!.map{ converter.map(movie: $0) }
        }
        
        return DiscoverMovieListResult(statusCode: .ok, movies: movies);
    }
    
    
}
