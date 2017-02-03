//
//  SplashViewController.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 26/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol SplashViewProtocol: ViewProtocol {
    func goToNextRoute();
}

class SplashViewController : BaseViewController, SplashViewProtocol {
    
    var navigator: SplashNavigatorProtocol?
    var presenter: SplashPresenterProtocol?
    
    override init() {
        super.init()
    }
    
    // MARK: View lifecycle
    var titleLabel: UILabel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.bindView();
        buildViewLayout();
        getConfiguration();
    }
    
    fileprivate func getConfiguration() {
        presenter?.getConfiguration();
    }
    
    // MARK: View Layout
    
    func buildViewLayout()
    {
        self.view.backgroundColor = UIColor(hexString: "#5C5C5E")
        
        self.view.addSubview(buildTitleLabel());
        
        titleLabel?.snp.makeConstraints { make in
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo(self.view).offset(70)
        }
        
        self.showProgressIndicator();
    }
    
    fileprivate func buildTitleLabel () -> UILabel {
        self.titleLabel = UILabel();
        self.titleLabel!.text = "iOS Cinema";
        self.titleLabel!.textColor = UIColor.white;
        self.titleLabel!.textAlignment = NSTextAlignment.center;
        self.titleLabel!.numberOfLines = 1;
        self.titleLabel!.lineBreakMode = .byWordWrapping;
        self.titleLabel!.font = UIFont.boldSystemFont(ofSize: 24);
        
        self.titleLabel!.sizeToFit()

        return self.titleLabel!;
    }
    
    //MARK: Protocols
    func bindView() {
        self.presenter?.bindView(view: self);
    }
    
    func displayError(message: String) {
        CinemaLogger.sharedInstance.error(message);
    }

    func goToNextRoute() {
        CinemaLogger.sharedInstance.debug("SUCCESS");
    }
    
}
