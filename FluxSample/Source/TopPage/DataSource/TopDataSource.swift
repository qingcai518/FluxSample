//
//  TopDataSource.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit
import RxSwift

class TopDataSource : NSObject {
    let topInfos = Variable([TopInfo]())
    
    func configure(with tableView: UITableView) {
        tableView.register(TopCell.self, forCellReuseIdentifier: TopCell.className)
        tableView.dataSource = self
        tableView.delegate  = self
        tableView.registerCell(cell: TopCell.self)
        tableView.tableFooterView = UIView()
    }
}

extension TopDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topInfos.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: TopCell.self)
        let info = topInfos.value[indexPath.row]
        cell.configure(with: info)
        return cell
    }
}

extension TopDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 + 2 * 24
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("to next page.")
    }
}

extension TopDataSource: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.bounds.size.height
        
        print("contentOffset Y = \(contentOffsetY)")
        print("content height = \(contentHeight)")
        print("height = \(height)")
        
        if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.bounds.size.height) {
            print("22222")
            TopAction.shared.getTopInfos(topInfos.value)
        }
    }
}
