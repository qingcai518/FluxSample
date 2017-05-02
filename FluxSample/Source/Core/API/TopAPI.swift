//
//  TopAPI.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import RxSwift
import Alamofire

struct TopAPI {
    static func getTopInfos(_ topInfos: [TopInfo]?) -> Observable<RecordsResponse<TopInfo>> {
        print("--------------------")
        print("get top infos = \(topInfos)")
        var offset = 0
        var records = [TopInfo]()
        
        if let topInfos = topInfos {
            offset = UserDefaults.standard.integer(forKey: UDKey.offset)
            records = topInfos
        }
        
        let params = ["count": count, "offset": offset]
        let url = URL(string: topPath)!
        
        print("params = \(params)")
        
        let observable = Observable<RecordsResponse<TopInfo>>.create { observer -> Disposable in
            Alamofire.request(url, method: .get, parameters: params).responseJSON(completionHandler: { response in
                if let error = response.error {
                    observer.onError(error)
                    return
                }
                
                
                guard let result = response.result.value as? NSArray else {
                    let castError = NSError(domain: "fail to cast JSON", code: 1, userInfo: nil)
                    observer.onError(castError)
                    return
                }
                
                for info in result {
                    guard let infoDic = info as? NSDictionary else {
                        continue
                    }
                    
                    guard let topInfo = TopInfo(infoDic: infoDic) else {
                        continue
                    }
                    
                    records.append(topInfo)
                }
                
                UserDefaults.standard.set(offset + records.count, forKey: UDKey.offset)
                UserDefaults.standard.synchronize()
                
                let recordResponse = RecordsResponse(records: records)
                observer.onNext(recordResponse)
                observer.onCompleted()
            })
            
            return Disposables.create()
        }
        
        return observable.take(1)
    }
}
