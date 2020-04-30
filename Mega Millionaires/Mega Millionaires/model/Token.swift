//
//  Token.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/7/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
class Token : NSObject, NSCoding{
    var round : String!
    var token : String!
    var date : String!
    var count : Int = 0
    var place : String!
    
    override init() {}
    
    init(round: String, token: String, date: String, count: Int, place: String!){
        self.round = round
        self.token = token
        self.date = date
        self.count = count
        self.place = place		
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let round = aDecoder.decodeObject(forKey: "round") as! String
        let token = aDecoder.decodeObject(forKey: "token") as! String
        let date = aDecoder.decodeObject(forKey: "date") as! String
        let count = aDecoder.decodeInteger(forKey: "count")
        let place = aDecoder.decodeObject(forKey: "place") as! String
        self.init(round: round, token: token, date: date, count: count,place: place)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(round, forKey: "round")
        aCoder.encode(token, forKey: "token")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(count, forKey: "count")
        aCoder.encode(place, forKey: "place")
    }
}
