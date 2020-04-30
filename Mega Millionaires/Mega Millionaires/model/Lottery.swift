//
//  Lottery.swift
//  Jackson Lottery
//
//  Created by Treinetic Macbook004 on 7/18/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation

class Lottery {
    
    private var lotteryName: String!
    private var latestDay: String!

    init(){}
    
    init(lotteryName : String! , latestDay: String! ) {
        self.lotteryName = lotteryName
        self.latestDay = latestDay
    }
    
    func setLotteryName (lotteryName : String!) {
        self.lotteryName = lotteryName
    }
    func setLatestDay (latestDay : String!) {
        self.latestDay = latestDay
    }
    
    func getLotteryName () -> String {
        return self.lotteryName
    }
    func getLatestDay () -> String {
        return self.latestDay
    }
}
