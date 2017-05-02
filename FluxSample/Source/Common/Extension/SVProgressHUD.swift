//
//  SVProgressHUD.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import SVProgressHUD

extension SVProgressHUD {
    static func changeStatus(_ value: Bool) {
        if (value) {
            SVProgressHUD.show()
        } else {
//            SVProgressHUD.setForegroundColor(UIColor.green)
            SVProgressHUD.showSuccess(withStatus: "OK")
            SVProgressHUD.dismiss(withDelay: 0.5)
        }
    }
}
