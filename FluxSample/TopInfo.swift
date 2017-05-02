//
//  TopInfo.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import Foundation

struct TopInfo {
    var itemId : Int
    var itemName: String
    var itemImageUrl: String
    var price : String
    var expired: String
    
    init?(infoDic: NSDictionary) {
        guard let itemIdStr = infoDic["id"] as? String else {
            return nil
        }
        
        guard let itemId = Int(itemIdStr) else {
            return nil
        }
        
        guard let itemName = infoDic["name"] as? String else {
            return nil
        }
        
        guard let itemImageUrl = infoDic["imageUrl"] as? String else {
            return nil
        }
        
        guard let price = infoDic["price"] as? String else {
            return nil
        }
        
        guard let expired = infoDic["expired"] as? String else {
            return nil
        }
        
        self.itemId = itemId
        self.itemName = itemName
        self.itemImageUrl = itemImageUrl
        self.price = price
        self.expired = expired
    }
}
