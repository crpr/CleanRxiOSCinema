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

struct DiscoverManager : DiscoverManagerProtocol {
    let provider: MoyaProvider<DiscoverService>
    
    init(provider: MoyaProvider<DiscoverService>) {
        self.provider = provider
    }
}

extension DiscoverManager {
    
    fileprivate func requestObject(_ token: DiscoverService) -> Observable<ApiResponse<ApiMovie>> {
        
        return Observable.create { observer in
            let disposable = self.provider.request(token) { result in
                switch result {
                case let .success(response):
                    do{
                        let object : ApiResponse<ApiMovie> = try response.mapObject(ApiResponse<ApiMovie>.self)
                        observer.onNext(object)
                        observer.onCompleted()
                    }catch{
                        observer.onError(error)
                    }
                    
                    break
                case let .failure(error):
                    observer.onError(error)
                }
                
            }
            
            return Disposables.create {
                disposable.cancel()
            }
        }
    }
}

extension DiscoverManager {
    func discover() -> Observable<ApiResponse<ApiMovie>>{
        return requestObject(.discover())
    }
}
