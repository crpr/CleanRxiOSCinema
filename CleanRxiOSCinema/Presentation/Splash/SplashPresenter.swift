//
//  SplashPresenter.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 26/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

protocol SplashPresenterProtocol {
    func getConfiguration();
}

class SplashPresenter : SplashPresenterProtocol {
    
    let disposeBag = DisposeBag();
    var interactor: SplashInteractorProtocol?;
    var isMakingRequest: Bool = false;
    
    init(interactor: SplashInteractorProtocol) {
        self.interactor = interactor;
    }
    
    func getConfiguration() {
        if isMakingRequest {
            return;
        }
        
        isMakingRequest = true;
        
        interactor?.start()
            .subscribe { event -> Void in
                switch event {
                case .next(let responseStatus):
                    self.onReceiveResult(result: responseStatus)
                case .error(let error):
                    self.showError(error: error)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }
    
    fileprivate func onReceiveResult(result: Int) {
        CinemaLogger.sharedInstance.debug("SUCCESS");
        CinemaLogger.sharedInstance.debug(result);
    }
    
    fileprivate func showError(error: Error) {
        print(error)
    }
    
}
