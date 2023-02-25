//
//  ForgetPasswordVC+ExtensionUITextFieldDelegate.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

extension ForgetPasswordViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBoderOfTextField(textfield: phoneTextField, label: repeatEnterPhoneLabel, height: repeatEnterPhoneLabelConstrain)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          let currentString: NSString = phoneTextField.text! as NSString
          let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
          return newString.length <= 11
      }
}

