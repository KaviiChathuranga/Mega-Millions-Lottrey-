//
//  ResultTableViewCell.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/7/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var n1Lbl: UILabel!
    @IBOutlet weak var n2Lbl: UILabel!
    @IBOutlet weak var n3Lbl: UILabel!
    @IBOutlet weak var n4Lbl: UILabel!
    @IBOutlet weak var n5Lbl: UILabel!
    @IBOutlet weak var midRow: UIView!
    @IBOutlet weak var roundLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var page = [Datas]() {
        didSet {
            for value in 0...page.count-1 {
                roundLbl.text = "Round "+"\(String(describing: page[value].draw!))"
                dateLbl.text = "\(String(describing: page[value].date!))"
                setMegaNumbers(lottery_results:  page[value].lottery_results)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setBorder()
        setCorners()
    }

    func setBorder(){
        midRow.layer.borderWidth = 10
        midRow.layer.borderColor = UIColor(named: "day blue")?.cgColor
        midRow.layer.cornerRadius = 20
        midRow.clipsToBounds = true
    }
    
    
    func setCorners(){
        if UIDevice.current.model == "iPhone" {
            n1Lbl.layer.cornerRadius = n1Lbl.frame.height/2
            n2Lbl.layer.cornerRadius = n2Lbl.frame.height/2
            n3Lbl.layer.cornerRadius = n3Lbl.frame.height/2
            n4Lbl.layer.cornerRadius = n4Lbl.frame.height/2
            n5Lbl.layer.cornerRadius = n5Lbl.frame.height/2
        }else{
            n1Lbl.layer.cornerRadius = 30
            n2Lbl.layer.cornerRadius = 30
            n3Lbl.layer.cornerRadius = 30
            n4Lbl.layer.cornerRadius = 30
            n5Lbl.layer.cornerRadius = 30
        }
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    func setMegaNumbers(lottery_results : [Lottery_Results]){
        n1Lbl.text = lottery_results[4].text
        n2Lbl.text = lottery_results[3].text
        n3Lbl.text = lottery_results[2].text
        n4Lbl.text = lottery_results[1].text
        n5Lbl.text = lottery_results[0].text
    }
    
    
}
