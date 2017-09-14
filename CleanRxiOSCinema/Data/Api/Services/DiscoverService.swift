//
//  DiscoverService.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 10/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import Moya
import Keys

enum DiscoverService : Moya.TargetType {
    case discover()
}

extension DiscoverService {
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    var path: String {
        switch self {
        case .discover:
            return "discover/movie"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .discover:
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
        case .discover:
            return stubbedResponse("api_discover_response");
        }
    }
    
    func stubbedResponse(_ filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
