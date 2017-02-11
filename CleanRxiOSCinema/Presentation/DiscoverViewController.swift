//
//  DiscoverViewController.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 11/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol DiscoverViewProtocol: ViewProtocol {
    func renderMovies(movies: [ListMovieModel]);
}

class DiscoverViewController : BaseViewController, DiscoverViewProtocol {
    
    var navigator: DiscoverNavigatorProtocol?
    var presenter: DiscoverPresenterProtocol?
    
    override init() {
        super.init()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.bindView();
        discoverMovies();
    }
    
    fileprivate func discoverMovies() {
        presenter?.discoverMovies();
    }
    
    func bindView() {
        self.presenter?.bindView(view: self);
    }
    
    func displayError(message: String) {
        CinemaLogger.sharedInstance.error(message);
    }
    
    func renderMovies(movies: [ListMovieModel]) {
        CinemaLogger.sharedInstance.error("Movies -> \(movies.count)");
    }
    
}
