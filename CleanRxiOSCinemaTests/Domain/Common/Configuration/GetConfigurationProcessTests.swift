//
//  GetConfigurationProcessTests.swift
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

class GetConfigurationProcessTests: QuickSpec {
    
    override func spec () {
        
        describe("a valid configuration process") {
            
            let manager = TestConfigurationManager();
            
            let process = GetConfigurationProcess(manager: manager);
            
            it("should be able to init a GetConfigurationProcess") {
                expect(process).toNot(beNil())
            }
            
            it("should receive success result from getConfiguration process") {
                
                let scheduler = TestScheduler(initialClock: 0);
                
                let observable = process.getConfiguration();
                
                let results = scheduler.createObserver(Result.self)
                var subscription: Disposable! = nil
                
                scheduler.scheduleAt(50) {
                    subscription = observable.subscribe(results)
                }
                
                scheduler.scheduleAt(100) {
                    subscription.dispose()
                }
                
                scheduler.start()
                
                expect(results.events[0].value.element).toNot(beNil())
                expect(results.events[0].value.element?.resultStatusCode.rawValue).to(equal(ResultStatus.ok.rawValue))
            }
        }
    }
}
