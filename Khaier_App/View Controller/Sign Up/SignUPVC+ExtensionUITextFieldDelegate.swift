//
//  SignUPVC+ExtensionUITextFieldDelegate.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

extension SignUpViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkTextField(textfield: phoneTextField, label: enterPhoneLabel, height: phoneErrorHeightConstrain)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          let currentString: NSString = phoneTextField.text! as NSString
          let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
          return newString.length <= 11
      }
    
}
