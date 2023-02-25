//
//  SecureTextField.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

class SecureTextField {
    
    var button: UIButton
    var textField: UITextField
    
    init(button: UIButton, textField: UITextField){
        self.button = button
        self.textField = textField
    }
    
    func checkPasswordVisiable(visable: inout Bool){
        visable ? button.setImage("eye") : button.setImage("eye-off")
        visable.toggle()
        textField.isSecureTextEntry.toggle()
    }
    
}
