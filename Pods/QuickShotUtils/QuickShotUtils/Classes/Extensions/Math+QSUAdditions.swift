//
//  Math+QSUAdditions.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation

public extension CGFloat {
  func round(toDecimals: Int = 2) -> CGFloat {
    let divisor = pow(10.0, CGFloat(toDecimals))
    return ceil(self * divisor) / divisor
  }
    
//    mutating func roundToDecimals(decimals: Int = 2) -> CGFloat {
//        let divisor = pow(10.0, CGFloat(decimals))
//        let retValue = CGFloat((self * divisor) / divisor)
//        return ceil(retValue)
//    }
  
  static func random() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}

public extension Double {
  /// Rounds the double to decimal places value
  func round(toDecimals:Int) -> Double {
    let divisor = pow(10.0, Double(toDecimals))
    return ceil(self * divisor) / divisor
  }
}

