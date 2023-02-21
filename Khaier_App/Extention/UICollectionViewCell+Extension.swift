//
//  UICollectionViewCell+Extension.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 21/02/2023.
//

import UIKit

extension UICollectionViewCell{
    
    func colorOfLabelText(label: UILabel, description: String){
        let myString = description.prefix(111)
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: String(myString), attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "BlackColor")!]));
        text.append(NSAttributedString(string: "...المزيد", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppColor")!]))
        label.attributedText = text
    }
    
    func checkSaveButtonIsAccept(isRemember: inout Bool, button: UIButton){
        isRemember.toggle()
        isRemember ? button.setImage("save-fill") : button.setImage("save")
    }

}
