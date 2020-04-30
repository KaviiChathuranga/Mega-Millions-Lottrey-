//
//  TokenArray.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/8/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
class TokenArray: NSObject, NSCoding{
    var tokenArray = [Token]()

    override init() {}
    
    init(tokenArray: [Token]) {
        self.tokenArray = tokenArray
    }
    
    
    required convenience init(coder aDecoder: NSCoder) {
        let tokenArray = aDecoder.decodeObject(forKey: "tokenArray") as! [Token]
        self.init(tokenArray: tokenArray)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(tokenArray, forKey: "tokenArray")
    }
    
    
}
