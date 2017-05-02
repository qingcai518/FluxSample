//
//  Date.swift
//  FluxSample
//
//  Created by Kaku Rai on 2017/05/02.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import Foundation

extension Date {
    private static let ISO8601Formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }()
    
    
    init?(ISO8601String string: String) {
        guard let date = Date.ISO8601Formatter.date(from: string) else {
            return nil
        }
        self = date
    }
}
