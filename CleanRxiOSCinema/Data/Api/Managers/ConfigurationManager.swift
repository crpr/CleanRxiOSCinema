//
//  ConfigurationManager.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 29/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper

protocol ConfigurationManagerProtocol {
    func configuration() -> Observable<ApiConfigurationResponse>;
}

struct ConfigurationManager : ConfigurationManagerProtocol {
    let provider: MoyaProvider<ConfigurationService>
    
    init(provider: MoyaProvider<ConfigurationService>) {
        self.provider = provider
    }
}

extension ConfigurationManager {
    
    fileprivate func requestObject(_ token: ConfigurationService) -> Observable<ApiConfigurationResponse> {
        
        return Observable.create { observer in
            let disposable = self.provider.request(token) { result in
                switch result {
                case let .success(response):
                    do{
                        let object : ApiConfigurationResponse = try response.mapObject(ApiConfigurationResponse.self)
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

extension ConfigurationManager {
    func configuration() -> Observable<ApiConfigurationResponse>{
        return requestObject(.configuration())
    }
}
