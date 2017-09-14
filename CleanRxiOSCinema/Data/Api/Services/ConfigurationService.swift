//
//  ConfigurationService.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 29/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import Moya
import Keys

enum ConfigurationService : Moya.TargetType {
    case configuration()
}

extension ConfigurationService {

    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    var path: String {
        switch self {
        case .configuration:
            return "configuration"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .configuration:
            return .get
        }
    }
    
    func authParameters() -> [String: String] {
        return ["api_key": CleanRxiOSCinemaKeys().cinemaApiKey]
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var task: Task {
        return .requestParameters(parameters: authParameters(), encoding: URLEncoding.default)
    }
    
    var sampleData: Data {
        switch self {
        case .configuration:
            return stubbedResponse("api_configuration_response");
        }
    }
    
    func stubbedResponse(_ filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
