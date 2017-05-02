//
//  UIScrollView.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/02.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit

extension UIScrollView {
    func isNearBottomEdge(edgeOffset: CGFloat = 20) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}
