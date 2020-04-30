//
//  AboutViewController.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/2/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var redBarView: UIView!
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var apkVersionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyExtentions()
        setAppVersion()
        
    }
    
    func setAppVersion(){
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        apkVersionLbl.text = "App Version "+"\(appVersion!)"
    }
    
    func applyExtentions(){
        redBarView.setViewBottomWhiteShadow()
        midView.layer.cornerRadius = 8
        midView.setViewBottomBlackBorder()
        
    }
}
