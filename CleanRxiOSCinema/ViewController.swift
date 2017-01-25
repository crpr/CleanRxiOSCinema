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
        
        let process = GetConfigurationProcess(manager: ApiContainer.getResolver().resolve(ConfigurationManager.self)!);
        
        process.getConfiguration()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMap { result -> Observable<Int> in {
                self.convert(result: result);
                }()
            }
            .observeOn(MainScheduler.instance)
            .subscribe { event -> Void in
                switch event {
                case .next(let responseStatus):
                    CinemaLogger.sharedInstance.debug(responseStatus);
                case .error(let error):
                    print(error)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }
    
    func convert(result: Result) -> Observable<Int> {
        return Observable.just(result.resultStatusCode.rawValue);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

