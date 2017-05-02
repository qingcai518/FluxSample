//
//  AppModel.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/02.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit

struct AppModel<T> {
    var elements: [T] = []
    var offset = 0
    
    static func make(from response: RecordsResponse<T>) -> AppModel {
        var model = AppModel<T>()
        model.elements = response.records
        model.offset = 0
        return model
    }
    
    func concat(model: AppModel) -> AppModel<T> {
        var newModel = AppModel<T>()
        newModel.elements = elements + model.elements
        newModel.offset = model.offset + model.elements.count
        return newModel
    }
}
