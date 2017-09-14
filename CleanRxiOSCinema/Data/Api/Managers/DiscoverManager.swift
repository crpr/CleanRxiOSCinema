//
//  DiscoverManager.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 10/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper

protocol DiscoverManagerProtocol {
    func discover() -> Observable<ApiResponse<ApiMovie>>;
}

class DiscoverManager : BaseManager<DiscoverService, ApiResponse<ApiMovie>>, DiscoverManagerProtocol {}

extension DiscoverManager {
    func discover() -> Observable<ApiResponse<ApiMovie>>{
        return requestObject(.discover())
    }
}
