//
//  Interactor.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 25/01/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import RxSwift

class Interactor {
    
    let mainThread: SchedulerType;
    let backgroundThread: SchedulerType;
    
    init(mainThread: SchedulerType, backgroundThread: DispatchQoS) {
        self.mainThread = mainThread;
        self.backgroundThread = ConcurrentDispatchQueueScheduler(qos: backgroundThread);
    }
}
