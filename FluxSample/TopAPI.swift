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
    static func getTopInfos(with params: [String: Any]?) -> Observable<RecordsResponse<TopInfo>> {
        let url = URL(string: apiBasePath + topPath)!
        let observable = Observable<RecordsResponse<TopInfo>>.create { observer -> Disposable in
            Alamofire.request(url, method: .get, parameters: nil).responseJSON(completionHandler: { response in
                if let error = response.error {
                    observer.onError(error)
                    return
                }
                
                var records = [TopInfo]()
                if let result = response.result.value as? NSArray {
                    for info in result {
                        guard let infoDic = info as? NSDictionary else {
                            continue
                        }
                        
                        guard let topInfo = TopInfo(infoDic: infoDic) else {
                            continue
                        }
                        
                        records.append(topInfo)
                    }
                }
                
                let recordResponse = RecordsResponse(records: records)
                observer.onNext(recordResponse)
                observer.onCompleted()
            })
            
            return Disposables.create()
        }
        
        return observable.take(1)
    }
}
