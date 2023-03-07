//
//  EditPasswordVC+ExtentionUITextFieldDelegate.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 05/03/2023.
//

import Foundation
import UIKit

extension EditPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBorderOfView(textfield: oldPasswordTextField, view: oldPasswordView, label: oldPasswordInvalidLabel, height: oldPasswordInvalidHeightLabel)
        checkColorBorderOfView(textfield: newPasswordTextField, view: newPasswordView, label: newPasswordInvalidLabel, height: newPasswordInvalidheightLabel)
        checkColorBorderOfView(textfield: confirmNewPasswordTextField, view: confirmNewPasswordView, label: confirmNewPasswordInvalidLabel, height: confirmNewPasswordInvalidheightLabel)
    }
    
    func setDelegateTextField(){
        let textFieldArray = [oldPasswordTextField, newPasswordTextField, confirmNewPasswordTextField]
        textFieldArray.forEach { $0?.delegate = self}
    }
    
}
