//
//  ViewController.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 29/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let manager = ConfigurationManager();
        
        manager.configuration()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMap { response -> Observable<String> in {
                self.convert(response: response);
                }()
            }
            .observeOn(MainScheduler.instance)
            .subscribe { event -> Void in
                switch event {
                case .next(let baseUrl):
                    CinemaLogger.sharedInstance.debug(baseUrl);
                case .error(let error):
                    print(error)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }
    
    func convert(response: ApiConfigurationResponse) -> Observable<String> {
        return Observable.just(self.extractFrom(response: response));
    }
    
    func extractFrom(response: ApiConfigurationResponse) -> String {
        return response.images_configuration.base_url
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

