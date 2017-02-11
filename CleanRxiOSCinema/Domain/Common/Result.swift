//
//  Result.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation

public enum ResultStatus : Int {
    case ok = 1
    case error = 2
}

class Result {
    
    let resultStatusCode: ResultStatus;
    let message: String?;
    
    init(statusCode: ResultStatus) {
        self.resultStatusCode = statusCode;
        self.message = "";
    }
    
    init(statusCode: ResultStatus, message: String) {
        self.resultStatusCode = statusCode;
        self.message = message;
    }
    
}
