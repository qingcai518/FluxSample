//
//  Store.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import RxSwift
import RxCocoa

class Store: ReactiveCompatible {
    let disposeBag = DisposeBag()
    
    func bind<O, E>(_ observable: O, _ param: Variable<E>) where O: ObservableType, O.E == E {
        observable.bind(to: param).addDisposableTo(disposeBag)
    }
    
    func bind<O, E>(_ observable: O, _ param : PublishSubject<E>) where O: ObservableType, O.E == E {
        observable.bind(to: param).addDisposableTo(disposeBag)
    }
}
