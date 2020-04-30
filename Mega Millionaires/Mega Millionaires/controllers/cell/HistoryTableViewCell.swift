//
//  HistoryTableViewCell.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/5/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var n1Lbl: UILabel!
    @IBOutlet weak var n2Lbl: UILabel!
    @IBOutlet weak var n3Lbl: UILabel!
    @IBOutlet weak var n4Lbl: UILabel!
    @IBOutlet weak var n6Lbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    
    @IBOutlet weak var roundLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var cupImg: UIImageView!
    var tokenArray = [Token]() {
        didSet {
            for value in 0...tokenArray.count-1 {
                setMegaNumbers(token: tokenArray[value].token)
                roundLbl.text = "Round : "+"\(tokenArray[value].round!)"
                dayLbl.text = tokenArray[value].date
                countLbl.text = "\(tokenArray[value].count)"
                if tokenArray[value].place == "pending" || tokenArray[value].place == ""{
                    if tokenArray[value].count == 0{
                          self.cupImg.image = UIImage(named: "icons8-trophy-cup-black")
                    }else{
                          self.cupImg.image = UIImage(named: "icons8-trophy-cup-white")
                    }
                }
            }
        }
    }
    
    func setMegaNumbers(token : String){
        n1Lbl.text =  String(token[0])
        n2Lbl.text =  String(token[1])
        n3Lbl.text =  String(token[2])
        n4Lbl.text =  String(token[3])
        n6Lbl.text =  String(token[4])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBorder()
        setCorners()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setBorder(){
        view.layer.borderWidth = 10
        view.layer.borderColor = UIColor(named: "day blue")?.cgColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
    }
    
    func setCorners(){
        if UIDevice.current.model == "iPhone"{
            n1Lbl.layer.cornerRadius = 15
            n2Lbl.layer.cornerRadius = 15
            n3Lbl.layer.cornerRadius = 15
            n4Lbl.layer.cornerRadius = 15
            n6Lbl.layer.cornerRadius = 15
        }else{
            n1Lbl.layer.cornerRadius = 25
            n2Lbl.layer.cornerRadius = 25
            n3Lbl.layer.cornerRadius = 25
            n4Lbl.layer.cornerRadius = 25
            n6Lbl.layer.cornerRadius = 25
        }
        countLbl.layer.cornerRadius =  countLbl.frame.height/2
     }

}
