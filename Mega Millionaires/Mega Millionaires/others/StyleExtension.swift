//
//  StyleExtension.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/13/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
import UIKit
class StyleExtension{}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIView {
    func setViewBottomWhiteShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0 , height:2)
    }
    func setViewBottomBlackBorder(){
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 4
        self.layer.borderWidth = 0.1
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.shadowOpacity = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0 , height:2)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]? = nil) {
        self.applyGradient(colours: colours, locations: locations, orientation: Enum.GradientOrientation.topLeftBottomRight)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?, orientation: Enum.GradientOrientation) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension UIButton{
    func setButtonBottomWhiteShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0 , height:2)
    }
}

extension UIView{
    func setViewBottomBlackShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0 , height:2)
    }
}
extension UITextField{
    func setTxtBorder(){
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.gray.cgColor
    }
}
