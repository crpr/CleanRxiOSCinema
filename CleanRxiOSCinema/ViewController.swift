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
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let interactor = SplashInteractor.init(mainThread: MainScheduler.instance,
                                               backgroundThread: ConcurrentDispatchQueueScheduler(qos: .background),
                                               process: ApiContainer.getResolver().resolve(GetConfigurationProcess.self)!)
        
        interactor.start()
            .subscribe { event -> Void in
                switch event {
                case .next(let responseStatus):
                    CinemaLogger.sharedInstance.debug("SUCCESS");
                    CinemaLogger.sharedInstance.debug(responseStatus);
                case .error(let error):
                    print(error)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

