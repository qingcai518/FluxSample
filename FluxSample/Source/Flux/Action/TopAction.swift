//
//  TopAction.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import RxSwift

class TopAction {
    static let shared = TopAction()
    private let disposeBag = DisposeBag()
    
    private init() {
        Logger.info(message: "[TopAction]")
    }
    
    func loading(_ value: Bool) {
        TopDispatcher.shared.loading.dispatch(value)
    }
    
    func getTopInfos(_ loadMore: Bool = false) {
        loading(true)
        TopAPI.getTopInfos(loadMore).do(onError: { [weak self] error in
            TopDispatcher.shared.error.dispatch(error)
            self?.loading(false)
        }).subscribe(onNext: { [weak self] response in
            TopDispatcher.shared.topInfos.dispatch((loadMore, response.records))
            self?.loading(false)
        }).addDisposableTo(disposeBag)
    }
}
