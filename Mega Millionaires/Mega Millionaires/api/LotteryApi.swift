//
//  LotteryApi.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/6/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LotteryApi{
    
    let urlString = Config.init().rootUrl + "/api/data"
    var response = "status Failed"
    typealias WebServiceResponse = (_ json: Data?,Error?) -> Void
    var param = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiTUVHQS1NSUxMSU9OQUlSRVMiLCJmcmVxdWVuY3kiOjcsImRhdGUiOiIyMDE5LTA3LTAxIiwiZHJhd19ubyI6IjEwMDEiLCJjYXNoX3ByaWNlIjoiNTAwMDAiLCJmb3JtYXQiOlt7InZhbHVlcyI6IkEtWiIsInR5cGUiOiJzdXBlciJ9LHsidmFsdWVzIjoiMC05IiwidHlwZSI6Im5vcm1hbCJ9LHsidmFsdWVzIjoiMC05IiwidHlwZSI6Im5vcm1hbCJ9LHsidmFsdWVzIjoiMC05IiwidHlwZSI6Im5vcm1hbCJ9LHsidmFsdWVzIjoiMC05IiwidHlwZSI6Im5vcm1hbCJ9XX0.Q4VO_Lrr1u0qHmaDtvTWty-GT-aREj9e_o0y8jTy750"
    
    // view all lottery
    func getAll(completion: @escaping WebServiceResponse){
        Alamofire.request(urlString + "?key=" + param , method: .get,encoding: JSONEncoding.default, headers: nil
            ).responseData { (response) in
                if let error = response.result.error {
                    completion(nil,error)
                }else if let jsonArray = response.value {
                    completion(jsonArray,nil)
                } else if let jsonObj = response.value {
                    completion(jsonObj,nil)
                }
        }
    }
}
