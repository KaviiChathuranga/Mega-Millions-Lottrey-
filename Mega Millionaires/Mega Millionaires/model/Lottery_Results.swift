//
//  Lottery_Results.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/2/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//


import Foundation
import SwiftyJSON
class Lottery_Results : NSObject, NSCoding {
    
    var id : String!
    var text : String!
    var type : String!
    var lottery_draw_id : String!
    var created_at : String!
    var updated_at : String!
    
    init(json : JSON){
         self.id = json["id"].stringValue
         self.text = json["text"].stringValue
         self.type = json["type"].stringValue
         self.lottery_draw_id = json["lottery_draw_id"].stringValue
         self.created_at = json["created_at"].stringValue
         self.updated_at = json["updated_at"].stringValue
     }
    
    init(id: String, text: String, type: String,lottery_draw_id: String,created_at: String,updated_at:String  ){
        
    }
    
    static func fromArray(json : JSON) -> [Lottery_Results] {
        return (json.array ?? []).map { jsonEmp in
            return Lottery_Results.init(json: jsonEmp)
        }
    }
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let text = aDecoder.decodeObject(forKey: "text") as! String
        let type = aDecoder.decodeObject(forKey: "type") as! String
        let lottery_draw_id = aDecoder.decodeObject(forKey: "lottery_draw_id") as! String
        let created_at = aDecoder.decodeObject(forKey: "created_at") as! String
        let updated_at = aDecoder.decodeObject(forKey: "updated_at") as! String
         self.init(id: id, text: text,type: type, lottery_draw_id: lottery_draw_id, created_at: created_at, updated_at: updated_at)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(text, forKey: "text")
        aCoder.encode(type, forKey: "type")
        aCoder.encode(lottery_draw_id, forKey: "lottery_draw_id")
        aCoder.encode(created_at, forKey: "created_at")
        aCoder.encode(updated_at, forKey: "updated_at")
     }
}
