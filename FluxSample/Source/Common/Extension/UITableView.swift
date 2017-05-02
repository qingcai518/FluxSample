//
//  UITableView.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit
import RxSwift

extension UITableView: Nibable {
    func reloadToStartPosition(includeInset: Bool = false) {
        reloadData()
        contentOffset = includeInset ? CGPoint(x: 0, y: contentInset.top) : .zero
    }
    
    // register.
    func registerCell<T: Nibable>(cell: T.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }
    
    //dequeue.
    func dequeueReusableCellWithIdentifier<T>(identifier: String) -> T {
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
    
    func dequeueReusableCellWithIdentifier<T>(identifier: String, forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
    
    func dequeueReusableCell<T: Nibable>(type: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier) as! T
    }
    
    func dequeueReusableCell<T: Nibable>(type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderFooterViewWithIdentifier<T>(identifier: String) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: identifier) as! T
    }
    
    func dequeueReusableHeaderFooterView<T: Nibable>(type: T.Type) -> T {
        return dequeueReusableHeaderFooterViewWithIdentifier(identifier: type.identifier)
    }
}
