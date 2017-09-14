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

class DiscoverViewController : BaseViewController, DiscoverViewProtocol, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var navigator: DiscoverNavigatorProtocol?
    var presenter: DiscoverPresenterProtocol?
    
    var collectionView: UICollectionView?
    var moviesCollection: [ListMovieModel]?;
    
    fileprivate let reuseIdentifier = "DiscoverItemCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    override init() {
        super.init()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupNavigationAppearence();
        setNavBarTitle(title: "iOS Cinema");
        
        self.bindView();
        discoverMovies();
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
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
        moviesCollection = movies;
        self.collectionView?.reloadData()
    }
    
}

extension DiscoverViewController {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        myCell.backgroundColor = UIColor.brown
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let itemsCount = moviesCollection?.count {
            return itemsCount
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        print("User tapped on item \(indexPath.row)")
    }
}
