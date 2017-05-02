//
//  ErrorNoticeDispatcher.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import Foundation

struct ErrorNoticeDispatcher {
    static let shared = ErrorNoticeDispatcher()
    let addError = DispatcherSubject<ErrorNoticeType>()
    let removeError = DispatcherSubject<ErrorNoticeType>()
    let removeAll = DispatcherSubject<Void>()
    let next = DispatcherSubject<Void>()
    let hide = DispatcherSubject<Void>()
    
    private init() {}
}
