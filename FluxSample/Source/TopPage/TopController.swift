//
//  TopController.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit
import RxSwift
import SVProgressHUD
import MJRefresh

class TopController: UIViewController, Storyboardable {
    @IBOutlet weak var tableView : UITableView!
    var header = MJRefreshGifHeader()
    
    let disposeBag = DisposeBag()

    private let dataSource = TopDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.configure(with: tableView)
        observeStore()
        TopAction.shared.getTopInfos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func observeStore() {
        TopStore.shared.rx.topInfos.asObservable().subscribe(onNext: { [weak self] topInfos in
            self?.dataSource.topInfos.value = topInfos
            self?.tableView.reloadData()
        }).addDisposableTo(disposeBag)
        
        TopStore.shared.rx.loading.asObservable().distinctUntilChanged().subscribe(onNext: { value in
            SVProgressHUD.changeStatus(value)
        }).addDisposableTo(disposeBag)
        
        TopStore.shared.rx.error.asObservable().subscribe(onNext: { error in
            ErrorNoticeAction.shared.show(.apiError(error))
        }).addDisposableTo(disposeBag)
    }
}
