//
//  Variable.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import RxSwift

extension Variable {
    func asShareReplayLatest() -> Observable<E> {
        return asObservable().shareReplayLatestWhileConnected()
    }
}
