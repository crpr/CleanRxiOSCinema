//
//  FixtureLoader.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import ObjectMapper

@testable import CleanRxiOSCinema

struct FixtureLoader {
    
    let data: Data
    let json: String
    
    init?(file: String, withExtension fileExt: String = "json", in bundle:Bundle = Bundle.main) {
        guard let path = bundle.path(forResource: file, ofType: fileExt) else {
            return nil
        }
        let pathURL = URL(fileURLWithPath: path)
        do {
            data = try Data(contentsOf: pathURL, options: .dataReadingMapped)
            if let decoded = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String {
                json = decoded
            } else {
                return nil
            }
        } catch{
            return nil
        }
    }
}

extension FixtureLoader {
    func map<T: Mappable>(to type: T.Type) -> T? {
        return Mapper<T>().map(JSONString: json)
    }
    
}
