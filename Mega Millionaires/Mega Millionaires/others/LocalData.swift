//
//  LocalData.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/7/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation

struct localDataFields {
    let userDefaults = UserDefaults.standard
}

class LocalData {
    
    private var structure = localDataFields()
    
    // save lottery api data array
    func saveDataSet(page: Page, key: String){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: page)
        structure.userDefaults.set(encodedData, forKey: key)
        structure.userDefaults.synchronize()
    }
    
    // save tokenArray object
    func saveTokenArrayDataSet(token: TokenArray, key: String){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: token)
        structure.userDefaults.set(encodedData, forKey: key)
        structure.userDefaults.synchronize()
    }
    
    // get tokenArray from localData
    func getAllTokenArrayLocalData() -> TokenArray {
        let decoded  = structure.userDefaults.data(forKey: "tokenArray")
        if decoded == nil {
            return TokenArray()
        }
        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! TokenArray
        let item = decodedTeams
        return item
    }
    
    // getAll lottery api data array
    func getAllLocalData() -> [Datas] {
        let decoded  = structure.userDefaults.data(forKey: "loto")
        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Page
        let item = decodedTeams.datas
        return item
    }
    
    // save one value into localdata (ex: token)
    func saveSngleValue(value: String, key: String){
        structure.userDefaults.set(value, forKey: key)
        structure.userDefaults.synchronize()
    }
    
    // get one value from localdata history (ex: token)
    func getSingleValue(key: String) -> String?{
        let decoded  = structure.userDefaults.string(forKey: key)
        return decoded
    }
    
    // save single Object to localdata (ex: Token.swift)
    func saveDataSet(token: Token, key: String){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: token)
        structure.userDefaults.set(encodedData, forKey: key)
        structure.userDefaults.synchronize()
    }
    
    // get single object from localData history (ex: Token.swift)
    func getCurrentToken() -> Token {
        let decoded  = structure.userDefaults.data(forKey: "token")
        
        if decoded == nil {
              return Token()
        }else{
            let decodedTeams = try?NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Token
            return decodedTeams!
        }
    }
    
}
