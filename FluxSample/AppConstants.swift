//
//  AppConstants.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import Foundation

enum ErrorNoticeType {
    case apiError(Error)
    
    var description: String {
        switch self {
        case .apiError(let error):
            return "通信に失敗しました\n\(error.localizedDescription)"
        }
    }
}
