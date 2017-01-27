//
//  ConfigurationManagerTests.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 27/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Quick
import Nimble
import Moya
import RxSwift
import RxTest

@testable import CleanRxiOSCinema

class ConfigurationManagerTests: QuickSpec {
    
    override func spec () {
        
        describe("fetch configuration with success") {
            
            let provider = MoyaProvider<ConfigurationService>(stubClosure: MoyaProvider.immediatelyStub)
            
            let manager = ConfigurationManager(provider: provider);
            
            it("should be able to init a configuration manager") {
                expect(manager).toNot(beNil())
            }
            
            it("should receive a valid ApiConfigurationResponse from Api Manager") {
                
                let scheduler = TestScheduler(initialClock: 0);
                
                let observable = manager.configuration();
                
                let results = scheduler.createObserver(ApiConfigurationResponse.self)
                var subscription: Disposable! = nil
                
                scheduler.scheduleAt(50) {
                    subscription = observable.subscribe(results)
                }
                
                scheduler.scheduleAt(100) {
                    subscription.dispose()
                }
                
                scheduler.start()
                
                expect(results.events[0].value.element?.images_configuration).toNot(beNil())
                expect(results.events[0].value.element?.change_keys.count).to(equal(7))
            }
        }
    }
}
