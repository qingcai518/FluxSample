//
//  TopNavigationController.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit

class TopNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let next = TopController.makeFromStoryboard()
        self.viewControllers = [next]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
