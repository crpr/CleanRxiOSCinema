//
//  SplashPresenter.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 26/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

protocol SplashPresenterProtocol: PresenterProtocol {
    func getConfiguration();
}

class SplashPresenter : SplashPresenterProtocol {
    
    let disposeBag = DisposeBag();
    var interactor: SplashInteractorProtocol?;
    var isMakingRequest: Bool = false;
    var view: SplashViewProtocol?;
    
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
        self.view?.goToNextRoute();
    }
    
    fileprivate func showError(error: Error) {
        self.view?.displayError(message: error.localizedDescription);
    }
    
    func bindView(view: ViewProtocol) {
        self.view = view as? SplashViewProtocol;
    }
    
}
