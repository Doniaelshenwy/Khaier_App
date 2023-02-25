//
//  ResetPasswordVC+ExtensionUITextFieldDelegate.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

extension ResetPasswordViewController: UITextFieldDelegate{
    
    func setDelegateTextField(){
        let textFieldArray = [passwordTextField, confirmPasswordTextField]
        textFieldArray.forEach { $0?.delegate = self}
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBorderOfView(textfield: passwordTextField, view: passwordView, label: passwordErrorLabel, height: passwordErrorHeightConstrain)
        checkColorBorderOfView(textfield: confirmPasswordTextField, view: confirmPasswordView, label: passwordConfirmLabel, height: passwordConfirmHeightConstrain)
    }
    
}
