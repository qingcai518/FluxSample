//
//  Nibable.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit

protocol Nibable : NSObjectProtocol {
}

extension Nibable {
    static var identifier : String {
        return className
    }
    
    static var nibName : String {
        return className
    }
    
    static var nib : UINib {
        return UINib(nibName: className, bundle: nil)
    }
    
    static func makeFromNib() -> Self {
        return nib.instantiate(withOwner: self, options: nil) as! Self
    }
}
