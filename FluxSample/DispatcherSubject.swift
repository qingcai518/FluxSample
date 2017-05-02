//
//  DispatcherSubject.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import RxSwift

class DispatcherSubject<Element>: ObservableType, ObserverType {
    typealias E = Element
    fileprivate let subject = PublishSubject<E>()
    
    func dispatch(_ value: E) {
        subject.onNext(value)
    }
    
    func on(_ event: Event<E>) {
        subject.on(event)
    }
    
    func subscribe<O: ObserverType>(_ observer: O) -> Disposable where E == O.E {
        return subject.subscribe(observer)
    }
}
