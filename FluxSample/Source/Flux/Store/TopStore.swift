
//
//  TopSgtore.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import RxSwift

class TopStore : Store {
    static let shared = TopStore()

    fileprivate let topInfos = Variable([TopInfo]())
    fileprivate let loading = Variable(false)
    fileprivate let error = PublishSubject<Error>()
    
    private init(dispatcher: TopDispatcher = .shared) {
        print("[TopStore]")
        super.init()
        
        
        dispatcher.topInfos.asObservable().subscribe(onNext: { [weak self] loadMore, infos in
            guard let me = self else { return }
            if (loadMore) {
                me.topInfos.value = me.topInfos.value + infos
            } else {
                me.topInfos.value = infos
            }
        }).addDisposableTo(disposeBag)
        
        bind(dispatcher.loading, loading)
        bind(dispatcher.error, error)
    }
}

extension Reactive where Base: TopStore {
    var topInfos : Observable<[TopInfo]> {
        return base.topInfos.asObservable().shareReplayLatestWhileConnected()
    }
    
    var loading: Observable<Bool> {
        return base.loading.asObservable().shareReplayLatestWhileConnected()
    }
    
    var error: Observable<Error> {
        return base.error
    }
}
