//
//  ViewController.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 29/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = SplashPresenter.init(interactor: ApiContainer.getResolver().resolve(SplashInteractorProtocol.self)!);
        presenter.getConfiguration();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

