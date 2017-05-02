//
//  Storyboardable.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit

protocol Storyboardable: NSObjectProtocol {
}

extension Storyboardable {
    static var storyboard : UIStoryboard {
        return UIStoryboard(name: className, bundle: nil)
    }
    
    static var identifier : String {
        return className
    }
    
    static func makeFromStoryboard() -> Self {
        return storyboard.instantiateInitialViewController() as! Self
    }
}
