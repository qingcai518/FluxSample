//
//  Logger.swift
//  FluxSample
//
//  Created by Kaku Rai on 2017/05/02.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import Foundation

class Logger: NSObject {
    class func debug(
        message: String,
        function: String = #function,
        file: String = #file,
        line: Int = #line) { Logger.write(loglevel: "[DEBUG]", message: message, function: function, file: file, line: line) }
    class func info(
        message: String,
        function: String = #function,
        file: String = #file,
        line: Int = #line) { Logger.write(loglevel: "[INFO]", message: message, function: function, file: file, line: line) }
    class func warning(
        message: String,
        function: String = #function,
        file: String = #file,
        line: Int = #line) { Logger.write(loglevel: "[WARNING]", message: message, function: function, file: file, line: line) }
    class func error(
        message: String,
        function: String = #function,
        file: String = #file,
        line: Int = #line) { Logger.write(loglevel: "[ERROR]", message: message, function: function, file: file, line: line) }
    class func write(
        loglevel: String,
        message: String,
        function: String,
        file: String,
        line: Int) {
        #if DEBUG
            let now = NSDate() // 現在日時の取得
            let dateFormatter = DateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
            dateFormatter.timeStyle = .medium
            dateFormatter.dateStyle = .medium
            
            let nowdate = dateFormatter.string(from: now as Date)
            
            var filename = file
            if let match = filename.range(of: "[^/]*$", options: .regularExpression) {
                filename = filename.substring(with: match)
            }
            
            print("\(loglevel) => \"\(message)\" \(nowdate) \(function) \(filename):(\(line))")
        #endif
    }
}

