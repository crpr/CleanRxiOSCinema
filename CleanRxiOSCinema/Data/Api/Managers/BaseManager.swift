//
//  BaseManager.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 14/09/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper

protocol BaseManagerProtocol {}

class BaseManager<T, R> where T: Moya.TargetType, R:BaseMappable {
    internal let provider: MoyaProvider<T>
    
    init(provider: MoyaProvider<T>) {
        self.provider = provider
    }
}

extension BaseManager {
    
    func requestObject(_ token: T) -> Observable<R> {
        
        return Observable.create { observer in
            let disposable = self.provider.request(token) { result in
                
                CinemaLogger.sharedInstance.debug("RESULT")
                CinemaLogger.sharedInstance.debug(result.value?.statusCode)
                CinemaLogger.sharedInstance.debug(result)
                
                switch result {
                case let .success(response):
                    do{
                        //Missing error handling
                        
                        let object = try response.mapObject(R.self)
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
