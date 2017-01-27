//
//  TestConfigurationManager.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 27/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

class TestConfigurationManager : ConfigurationManagerProtocol {
    
    func configuration() -> Observable<ApiConfigurationResponse> {
        return Observable.just(buildResponse());
    }
    
    fileprivate func buildResponse() -> ApiConfigurationResponse {
        let testBundle = Bundle(for: type(of: self))
        let fixtureLoader = FixtureLoader(file: "api_configuration_response", in: testBundle)
        return (fixtureLoader?.map(to: ApiConfigurationResponse.self))!;
    }
    
}
