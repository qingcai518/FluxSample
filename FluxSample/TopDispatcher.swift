//
//  TopDispatcher.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit

class TopDispatcher {
    static let shared = TopDispatcher()
    
    let loading = DispatcherSubject<Bool>()
    let error = DispatcherSubject<Error>()
    let topInfos = DispatcherSubject<[TopInfo]>()
    
    private init() {}
}
