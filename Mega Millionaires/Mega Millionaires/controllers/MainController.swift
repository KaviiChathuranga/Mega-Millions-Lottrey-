//
//  ViewController.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/2/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit
import SwiftyJSON

struct mainViewFields {
    var lotteryAPi = LotteryApi()
    var page = Page()
    var maxRound = ""
    var tempTokenArray = TokenArray()
    var count = 0
    var loadData = LocalData()
 }

class MainController: UIViewController {
    
    var structure = mainViewFields()
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var refreshControl = UIRefreshControl()
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRefreshView()
        headerView.setViewBottomWhiteShadow()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        loadData()
        refreshControl.endRefreshing()
    }
    
    func setRefreshView(){
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing .... ")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        table.addSubview(refreshControl)
    }
    
    func loadData(){
        print("URL Data Loading  ....")
        indicator.startAnimating()
        structure.lotteryAPi.getAll()
            { (json,error) in
                if let error = error {
                    print(error.localizedDescription)
                    self.indicator.stopAnimating()
                }else{
                    let d = try?JSON.init(data : json!)
                    let returnValue = Page.init(json: d!)
                    if returnValue.page == "1" {
                         self.structure.page = returnValue
                         self.structure.loadData.saveDataSet(page: self.structure.page , key: "loto")
                        
                         self.findMax()
                            DispatchQueue.main.async { [weak self] in
                                self!.table.reloadData()
                                self!.indicator.stopAnimating()
                            }
                    }else{
                        print("empty value")
                        self.indicator.stopAnimating()
                    }
                }
        }
    }
    func findMax(){
        structure.maxRound = self.structure.page.datas.map { $0.draw }.max()!
        if self.structure.loadData.getCurrentToken().token == nil || self.structure.loadData.getCurrentToken().token == "" {
        }else{
            let a:Int? = Int(structure.maxRound)
            let value = a!+1
            if String(value) == self.structure.loadData.getCurrentToken().round! {
            } else {
                checkWinningNumbersCount()
                self.structure.loadData.saveDataSet(token: Token(round: "", token: "", date: "", count: 0,place: ""), key: "token")
            }
        }
    }
    
    // mact slot numbers one by one
    func checkWinningNumbersCount(){
        structure.tempTokenArray = self.structure.loadData.getAllTokenArrayLocalData()
        let latestCard = self.structure.page.datas.first
        let lastToken = structure.tempTokenArray.tokenArray.popLast()
        
        if lastToken == nil {
            return
        }
        
        if String((lastToken?.token[0])!) == latestCard?.lottery_results[4].text {
            structure.count += 1
        }
        if String((lastToken?.token[1])!) == latestCard?.lottery_results[3].text {
            structure.count += 1
        }
        if String((lastToken?.token[2])!) == latestCard?.lottery_results[2].text {
            structure.count += 1
        }
        if String((lastToken?.token[3])!) == latestCard?.lottery_results[1].text {
            structure.count += 1
        }
        if String((lastToken?.token[4])!) == latestCard?.lottery_results[0].text {
            structure.count += 1
        }
        
        let token = Token(round: lastToken!.round!, token: lastToken!.token!, date: lastToken!.date!, count: structure.count, place: "pending") as Token
        
        structure.tempTokenArray.tokenArray.append(token)
        self.structure.loadData.saveTokenArrayDataSet(token: structure.tempTokenArray, key: "tokenArray")
    }
}
