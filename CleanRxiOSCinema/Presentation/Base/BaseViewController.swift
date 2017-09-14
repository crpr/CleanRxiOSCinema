//
//  BaseViewController.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 27/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import UIKit
import QuickShotUtils

class BaseViewController :  QSUBaseViewController {
    
    var didSetupConstraints = false
    
    init() {
        super.init()
    }
    
    required convenience init(coder: NSCoder) {
        self.init();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white;
        
        view.setNeedsUpdateConstraints() //bootstrap autolayout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func setupNavigationAppearence() {
        let navBar = navigationController?.navigationBar;
        if(navBar != nil){
            navBar!.barTintColor = UIColor(hexString: "#5C5C5EFF") //background color
            navBar!.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]; //title text color
            navBar!.tintColor = UIColor.white; //navigation and back button text color
            navBar!.isTranslucent = false
            navBar!.isHidden = false
        }
    }
    
}
