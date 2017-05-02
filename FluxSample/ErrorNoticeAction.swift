//
//  ErrorNoticeAction.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import Foundation

struct ErrorNoticeAction {
    static let shared = ErrorNoticeAction()
    
    private init() {}
    
    func show(_ type: ErrorNoticeType) {
        ErrorNoticeDispatcher.shared.addError.dispatch(type)
    }
    
    func remove(_ type: ErrorNoticeType) {
        ErrorNoticeDispatcher.shared.removeError.dispatch(type)
    }
    
    func removeAll() {
        ErrorNoticeDispatcher.shared.removeAll.dispatch()
    }
    
    func next() {
        ErrorNoticeDispatcher.shared.next.dispatch()
    }
    
    func hide() {
        ErrorNoticeDispatcher.shared.hide.dispatch()
    }
}
