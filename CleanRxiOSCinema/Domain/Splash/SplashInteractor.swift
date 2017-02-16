//
//  SplashInteractor.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

protocol SplashInteractorProtocol {
    func start() -> Observable<Int>;
}

class SplashInteractor : Interactor, SplashInteractorProtocol {
    
    var process: GetConfigurationProcessProtocol?;

    init(mainThread: SchedulerType, backgroundThread: DispatchQoS, process: GetConfigurationProcessProtocol) {
        super.init(mainThread: mainThread, backgroundThread: backgroundThread);
        self.process = process;
    }
    
    func start() -> Observable<Int> {
        return (process?.getConfiguration()
            .subscribeOn(self.backgroundThread)
            .flatMap { result -> Observable<Int> in {
                self.convert(result: result);
                }()
            }
            .observeOn(self.mainThread))!
    }
    
    fileprivate func convert(result: Result) -> Observable<Int> {
        return Observable.just(result.resultStatusCode.rawValue);
    }
    
}
