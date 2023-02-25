//
//  LoginVC+ExtensionUITextFieldDelegate.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

extension LoginViewController : UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBorderOfView(textfield: phoneTextField, view: phoneView, label: repeatPhoneLabel, height: phoneErrorHeightConstrain)
        checkColorBorderOfView(textfield: passwordTextField, view: passwordView, label: repeatPasswordLabel, height: passwordErrorHeightConstrain)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTextField{
          let currentString: NSString = textField.text! as NSString
          let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
          return newString.length <= maxLength
        }
        return true
      }
    
}
