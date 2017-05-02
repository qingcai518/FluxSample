//
//  TopInfo.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import Foundation
import Himotoki

struct TopInfo:Decodable {
    var itemId : String
    var itemName: String
    var itemImageUrl: String
    var price : String
    var expired: String
    
    // MARK: Decodable
    static func decode(_ e: Extractor) throws -> TopInfo {
        return try TopInfo(
            itemId: e <| "id",
            itemName: e <| "name",
            itemImageUrl: e <| "imageUrl",
            price: e <| "price",
            expired: e <| "expired"
        )
    }
}
