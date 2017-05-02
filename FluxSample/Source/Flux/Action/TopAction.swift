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
        print("[TopAction]")
    }
    
    func loading(_ value: Bool) {
        TopDispatcher.shared.loading.dispatch(value)
    }
    
    func getTopInfos() {
        loading(true)
        TopAPI.getTopInfos(with: nil).do(onError: { [weak self] error in
            TopDispatcher.shared.error.dispatch(error)
            self?.loading(false)
        }).subscribe(onNext: { [weak self] response in
            TopDispatcher.shared.topInfos.dispatch(response.records)
            self?.loading(false)
        }).addDisposableTo(disposeBag)
    }
}
