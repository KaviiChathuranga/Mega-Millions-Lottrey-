//
//  Page.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/2/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
import SwiftyJSON

class Page : NSObject, NSCoding{
    var page : String!
    var datas = [Datas]()
    
    override init() {}
    
    init(json : JSON) {
        self.page = json["current_page"].stringValue
        self.datas = Datas.fromArray(json: json["data"])
    }
    init(page: String, datas: [Datas]) {
        self.page = page
        self.datas = datas
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        print(aDecoder.decodeObject(forKey: "current_page") as Any)
        let page = aDecoder.decodeObject(forKey: "current_page") as! String
        let datas = aDecoder.decodeObject(forKey: "data") as! [Datas]
        self.init(page: page, datas: datas)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(page, forKey: "current_page")
        aCoder.encode(datas, forKey: "data")
    }
    
}
