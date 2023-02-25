//
//  AccountVC+ExtensionUITextFieldDelegate.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

extension AccountViewController: UITextFieldDelegate {
//    func textViewDidChangeSelection(_ textView: UITextView) {
//        checkTextField(textfield: userNameTextField, label: userNameInvalidLabel, height: userNameInvalidHeightConstrain)
//        checkTextField(textfield: nameTextField, label: nameInvalidLabel, height: nameInvalidHeightConstrain)
//        checkPasswordView(textfield: passwordTextField, view: passwordView, label: passwordInvalidLabel, height: passwordInvalidHeightConstrain)
//        checkPasswordView(textfield: confirmPasswordTextField, view: confirmPasswordView, label: confirmPasswordInvalidLabel, height: confirmPasswordInvalidHeightConstrain)
//
//    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBoderOfTextField(textfield: userNameTextField, label: userNameInvalidLabel, height: userNameInvalidHeightConstrain)
        checkColorBoderOfTextField(textfield: nameTextField, label: nameInvalidLabel, height: nameInvalidHeightConstrain)
        checkColorBorderOfView(textfield: passwordTextField, view: passwordView, label: passwordInvalidLabel, height: passwordInvalidHeightConstrain)
        checkColorBorderOfView(textfield: confirmPasswordTextField, view: confirmPasswordView, label: confirmPasswordInvalidLabel, height: confirmPasswordInvalidHeightConstrain)
    }
    
    func checkAddressView(cityLabel: UILabel, view: UIView, label: UILabel, height: NSLayoutConstraint) {
        if cityLabel.text == "اختر المدينة و المنطقة" {
            setGrayColorView(view)
            hideLabel(heightConstrain: height, repeatLabel: label)
        } else {
            setAppColorView(view)
            hideLabel(heightConstrain: height, repeatLabel: label)
        }
    }
    
    func setDelegateTextField(){
        let textFieldDelegate = [userNameTextField, nameTextField, passwordTextField, confirmPasswordTextField]
        textFieldDelegate.forEach { $0?.delegate = self}
    }
}
