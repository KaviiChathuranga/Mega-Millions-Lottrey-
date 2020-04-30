//
//  Result.swift
//  Jackson Lottery
//
//  Created by Treinetic Macbook004 on 7/19/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
class Result{
    private var latestDay: String!
    private var rounds: String!
    
    init(){}
    
    init(latestDay: String! ,rounds: String!) {
        self.rounds = rounds
        self.latestDay = latestDay
    }
    
    func setRounds (rounds : String!) {
        self.rounds = rounds
    }
    func setLatestDay (latestDay : String!) {
        self.latestDay = latestDay
    }
    
    func getRounds () -> String {
        return self.rounds
    }
    func getLatestDay () -> String {
        return self.latestDay
    }
}
