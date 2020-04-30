//
//  HistoryViewController.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/2/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit

struct historyFields{
    var tokenArray = TokenArray()
    var tok = Token()
    var cuurentHeight = CGFloat()
    var tempTokenArray = TokenArray()
    var tempSearchingData = TokenArray()  // temp object to store data array
    var localData = LocalData()
}
class HistoryViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var warningsView: UIView!
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cupImage: UIImageView!
    @IBOutlet weak var roundLbl: UILabel!
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var l1Lbl: UILabel!
    @IBOutlet weak var l2Lbl: UILabel!
    @IBOutlet weak var l3Lbl: UILabel!
    @IBOutlet weak var l4Lbl: UILabel!
    @IBOutlet weak var l5Lbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    var structure = historyFields()
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        structure.cuurentHeight = cardView.frame.height
        setDelegate()
        setBorder()
        setCorners()
        loadTempTokenList()
        structure.tempSearchingData.tokenArray = structure.tempTokenArray.tokenArray
        createRefreshTableMethod()
        self.hideKeyboardWhenTappedAround()
        headerView.setViewBottomWhiteShadow()
     }

    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func setDelegate(){
        searchTxt.delegate = self
    }
    
    func createRefreshTableMethod(){
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing .... ")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        table.addSubview(refreshControl)
    }
    
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        loadData()
        refreshControl.endRefreshing()
    }
    
    @IBAction func searchTxtChange(_ sender: Any) {
       
        let txt = searchTxt.text ?? ""
        let data = filterContains(text: txt)
        structure.tempTokenArray.tokenArray.removeAll()
        if  data.count != 0 {
             structure.tempTokenArray.tokenArray = data
        }else{
             structure.tempTokenArray.tokenArray.removeAll()
        }
        if txt.isEmpty {
            structure.tempTokenArray.tokenArray =  structure.tempSearchingData.tokenArray
        }
        
        DispatchQueue.main.async { [weak self] in
            self!.table.reloadData()
        }
    }

    func loadData(){
        structure.tokenArray = structure.localData.getAllTokenArrayLocalData()
        structure.tempTokenArray.tokenArray =  structure.tokenArray.tokenArray
        structure.tempSearchingData.tokenArray = structure.tempTokenArray.tokenArray
        
            DispatchQueue.main.async { [weak self] in
                self!.table.reloadData()
            }
        
        if structure.localData.getCurrentToken().token == nil || structure.localData.getCurrentToken().token == ""{
            cardView.isHidden = true
            warningsView.isHidden = false
            return
        }
        
        if structure.tokenArray.tokenArray.count >= 1 {
            structure.tok = structure.tokenArray.tokenArray.popLast()!
            cardView.isHidden = false
            warningsView.isHidden = true
            loadTempTokenList()
            setCurrentCard()
            return
        }
        
        if structure.tokenArray.tokenArray.count != 0 {
            cardView.isHidden = false
            warningsView.isHidden = true
            setCurrentCard()
        
        }else{
            cardView.isHidden = true
            warningsView.isHidden = false
        }
    }
    
    func setCurrentCard(){
        if structure.tok.token == nil {
            return
        }
        l1Lbl.text = String(structure.tok.token[0])
        l2Lbl.text = String(structure.tok.token[1])
        l3Lbl.text = String(structure.tok.token[2])
        l4Lbl.text = String(structure.tok.token[3])
        l5Lbl.text = String(structure.tok.token[4])
        roundLbl.text = "Round : "+"\(structure.tok.round!)"
        dataLbl.text = structure.tok.date
    }
}
