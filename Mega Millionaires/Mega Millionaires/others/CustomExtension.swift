//
//  CustomExtension.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/7/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
import UIKit

class CustomExtension{}

extension MainController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return structure.page.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lotteryResultCell",for : indexPath) as! ResultTableViewCell
        cell.page = [structure.page.datas[indexPath.row]]
        return cell
    }
}

extension NewTokenViewController{
    func createAlert(title : String!, body : String!, type: String!){
        
        if type == "confirm" {
            let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
                // call NewTokenViewController check method and change btn types
                self.check(type: type, action: "ok")
                
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { (action: UIAlertAction!) in
                
                // call NewTokenViewController check method and change btn types
                self.check(type: type, action:  "cancel")
            })
            alertController.addAction(okAction)
            alertController.addAction(cancel)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if type == "default" {
            let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
                
                // call NewTokenViewController check method and change btn types
                self.check(type: type, action: "ok")
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        if type == "warnings" {
            let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: { (action: UIAlertAction!) in
                
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func clearTxtBoxes(){
        n1Txt.text = ""
        n2Txt.text = ""
        n3Txt.text = ""
        n4Txt.text = ""
        n6Txt.text = ""
    }
    func getCurrentDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        return result
    }
    func setTxtBorder(){
        n1Txt.setTxtBorder()
        n2Txt.setTxtBorder()
        n3Txt.setTxtBorder()
        n4Txt.setTxtBorder()
    }
    func setShadow(){
        saveBtn.setButtonBottomWhiteShadow()
        clearBtn.setButtonBottomWhiteShadow()
    }
}


extension HistoryViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (LocalData().getCurrentToken().token != nil || LocalData().getCurrentToken().token != "") && structure.tempTokenArray.tokenArray.count == 1 {
            return 1
        }
        
        if structure.tempTokenArray.tokenArray.count == 1 {
            return 0
        }
        return structure.tempTokenArray.tokenArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell",for : indexPath) as! HistoryTableViewCell
        print("Numbers Matched ",structure.tempTokenArray.tokenArray[indexPath.row].count)

        cell.tokenArray = [structure.tempTokenArray.tokenArray[indexPath.row]]
        return cell
    }
    
    func setBorder(){
        cardView.layer.borderWidth = 10
        cardView.layer.borderColor = UIColor(named: "day blue")?.cgColor
        cardView.layer.cornerRadius = 20
        cardView.clipsToBounds = true
    }
    
    func setCorners(){
        searchBar.layer.cornerRadius = 22
        warningsView.layer.cornerRadius = 22
        
        if UIDevice.current.model == "iPhone"{
            l1Lbl.layer.cornerRadius = 15
            l2Lbl.layer.cornerRadius = 15
            l3Lbl.layer.cornerRadius = 15
            l4Lbl.layer.cornerRadius = 15
            l5Lbl.layer.cornerRadius = 15
        }else{
            l1Lbl.layer.cornerRadius = 25
            l2Lbl.layer.cornerRadius = 25
            l3Lbl.layer.cornerRadius = 25
            l4Lbl.layer.cornerRadius = 25
            l5Lbl.layer.cornerRadius = 25
        }
    }
    
    func filterContains(text : String!) -> [Token] {
        guard text != nil else {
            return self.structure.tempSearchingData.tokenArray
        }
        return self.structure.tempSearchingData.tokenArray.filter { (x) -> Bool in
            self.structure.tempSearchingData.tokenArray[0].round!.contains(text!)
        }
    }
    
    func loadTempTokenList(){
        structure.tempTokenArray = LocalData.init().getAllTokenArrayLocalData()
        if structure.tempTokenArray.tokenArray.count != 0 {
            structure.tempTokenArray.tokenArray.removeLast()
        }
        structure.tempSearchingData.tokenArray = structure.tempTokenArray.tokenArray
        DispatchQueue.main.async { [weak self] in
            self!.table.reloadData()
        }
    }
}
