//
//  AppConstants.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import Foundation
import UIKit

enum ErrorNoticeType {
    case apiError(Error)
    
    var description: String {
        switch self {
        case .apiError(let error):
            return "通信に失敗しました\n\(error.localizedDescription)"
        }
    }
}

var idleImages :[UIImage] {
    return [UIImage(named: "fishing1")!]
}

var pullImages: [UIImage] {
    return [UIImage(named: "fishing2")!]
}

var refreshImages : [UIImage] {
    return [
        UIImage(named: "fishing3")!,
        UIImage(named: "fishing4")!
    ]
}
