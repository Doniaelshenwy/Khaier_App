//
//  UIButtonExtention.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 06/02/2023.
//

import UIKit

extension UIButton{
    func setImage(_ name: String){
        setImage(UIImage(named: name), for: .normal)
    }
}

extension UIButton {
    func setDisable() {
        isEnabled = false
        backgroundColor = UIColor(named: "DisableColor")
    }
    
    func setEnable() {
        isEnabled = true
        backgroundColor = UIColor(named: "AppColor")
    }
}
