//
//  ApiImagesConfigurationTests.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import CleanRxiOSCinema

class ApiImagesConfigurationTests: QuickSpec {
    
    override func spec () {
        
        describe("a valid ApiImagesConfiguration Model") {
            
            var model : ApiImagesConfiguration!;
            
            let testBundle = Bundle(for: type(of: self))
            let fixtureLoader = FixtureLoader(file: "api_configuration_model", in: testBundle)
            model = fixtureLoader?.map(to: ApiImagesConfiguration.self)
            
            it("should be able to create a valid ApiImagesConfiguration from json") {
                expect(model).toNot(beNil())
            }
            
            it("should have a baseUrl") {
                expect(model.base_url).toNot(beNil())
            }
            
            it("should have four backdrop sizes") {
                expect(model.backdrop_sizes.count).to(equal(4))
            }
            
            it("should have seven logo sizes") {
                expect(model.logo_sizes.count).to(equal(7))
            }
            
            it("should have seven poster sizes") {
                expect(model.poster_sizes.count).to(equal(7))
            }
            
            it("should have four profile sizes") {
                expect(model.profile_sizes.count).to(equal(4))
            }
            
            it("should have four still sizes") {
                expect(model.still_sizes.count).to(equal(4))
            }
        }
        
    }
}
