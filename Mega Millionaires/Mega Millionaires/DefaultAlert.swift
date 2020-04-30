//
//  DefaultAlert.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/5/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
import UIKit
class DefaultAlert : UIView{
    
    func createAlert(){
        print("called")
        let alertController = UIAlertController(title: "Clicked!", message: "Token Saved!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
        UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
