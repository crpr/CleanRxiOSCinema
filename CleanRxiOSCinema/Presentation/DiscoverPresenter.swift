//
//  DiscoverPresenter.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 11/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

protocol DiscoverPresenterProtocol: PresenterProtocol {
    func discoverMovies();
}

class DiscoverPresenter : DiscoverPresenterProtocol {
    
    let disposeBag = DisposeBag();
    var interactor: DiscoverInteractorProtocol?;
    var isMakingRequest: Bool = false;
    var view: DiscoverViewProtocol?;
    
    init(interactor: DiscoverInteractorProtocol) {
        self.interactor = interactor;
    }
    
    func discoverMovies() {
        if isMakingRequest {
            return;
        }
        
        isMakingRequest = true;
        
        interactor?.discover()
            .subscribe { event -> Void in
                switch event {
                case .next(let movies):
                    self.onReceiveResult(result: movies)
                case .error(let error):
                    self.showError(error: error)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }
    
    fileprivate func onReceiveResult(result: [ListMovieModel]) {
        self.view?.renderMovies(movies: result);
    }
    
    fileprivate func showError(error: Error) {
        self.view?.displayError(message: error.localizedDescription);
    }
    
    func bindView(view: ViewProtocol) {
        self.view = view as? DiscoverViewProtocol;
    }
    
}
