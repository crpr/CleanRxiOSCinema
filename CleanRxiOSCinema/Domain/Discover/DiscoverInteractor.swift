//
//  DiscoverInteractor.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 10/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

protocol DiscoverInteractorProtocol {
    func discover() -> Observable<[ListMovieModel]>;
}

class DiscoverInteractor : Interactor, DiscoverInteractorProtocol {
    
    var process: DiscoverProcessProtocol?;
    
    init(mainThread: SchedulerType, backgroundThread: DispatchQoS, process: DiscoverProcessProtocol) {
        super.init(mainThread: mainThread, backgroundThread: backgroundThread);
        self.process = process;
    }
    
    func discover() -> Observable<[ListMovieModel]> {
        return (process?.discover()
            .subscribeOn(self.backgroundThread)
            .flatMap { result -> Observable<[ListMovieModel]> in {
                self.convert(result: result);
                }()
            }
            .observeOn(self.mainThread))!
    }
    
    fileprivate func convert(result: DiscoverMovieListResult) -> Observable<[ListMovieModel]> {
        return Observable.just(result.models!);
    }
    
}
