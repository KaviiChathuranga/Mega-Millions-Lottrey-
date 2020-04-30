//
//  Datas.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/2/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
import SwiftyJSON

class Datas : NSObject, NSCoding{
    
    var id : String!
    var draw : String!
    var date : String!
    var lotteryId : String!
    var created_at : String!
    var updated_at : String!
    var lottery_results = [Lottery_Results]()
    
    override init() {}
   
    init(json : JSON) {
        self.id = json["id"].stringValue
        self.draw = json["draw"].stringValue
        self.date = json["formatted_date"].stringValue
        self.lotteryId = json["lotteryId"].stringValue
        self.created_at = json["created_at"].stringValue
        self.updated_at = json["updated_at"].stringValue
        self.lottery_results = Lottery_Results.fromArray(json: json["lottery_results"])
    }
    
    init(id: String, draw: String,date: String, lotteryId: String, created_at: String, updated_at: String,lottery_results: [Lottery_Results]){
        self.id = id
        self.draw = draw
        self.date = date
        self.lotteryId = lotteryId
        self.created_at = created_at
        self.updated_at = updated_at
        self.lottery_results = lottery_results
    }
    
    static func fromArray(json : JSON) -> [Datas] {
        return (json.array ?? []).map { jsonEmp in
            return Datas.init(json: jsonEmp)
        }
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let draw = aDecoder.decodeObject(forKey: "draw") as! String
        let date = aDecoder.decodeObject(forKey: "formatted_date") as! String
        let lotteryId = aDecoder.decodeObject(forKey: "lotteryId") as! String
        let created_at = aDecoder.decodeObject(forKey: "created_at") as! String
        let updated_at = aDecoder.decodeObject(forKey: "updated_at") as! String
        let lottery_results = aDecoder.decodeObject(forKey: "lottery_results") as! [Lottery_Results]
        self.init(id: id, draw: draw,date: date, lotteryId: lotteryId, created_at: created_at, updated_at: updated_at,lottery_results: lottery_results)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(draw, forKey: "draw")
        aCoder.encode(date, forKey: "formatted_date")
        aCoder.encode(lotteryId, forKey: "lotteryId")
        aCoder.encode(created_at, forKey: "created_at")
        aCoder.encode(updated_at, forKey: "updated_at")
        aCoder.encode(lottery_results, forKey: "lottery_results")
    }
    
}



