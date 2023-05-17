//
//  AccountVC+ExtensionUITextFieldDelegate.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

extension AccountViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBoderOfTextField(textfield: userNameTextField, label: userNameInvalidLabel, height: userNameInvalidHeightConstrain)
        checkColorBoderOfTextField(textfield: nameTextField, label: nameInvalidLabel, height: nameInvalidHeightConstrain)
        checkColorBorderOfView(textfield: passwordTextField, view: passwordView, label: passwordInvalidLabel, height: passwordInvalidHeightConstrain)
        checkColorBorderOfView(textfield: confirmPasswordTextField, view: confirmPasswordView, label: confirmPasswordInvalidLabel, height: confirmPasswordInvalidHeightConstrain)
        checkCityView(textField: cityTextField, view: cityView, label: addressInvalidLabel, height: addressInvalidConstrain)
        checkRegionView(textField: regionTextField, view: regionView, label: regionInvalidLabel, height: regionHeightInvalidLabel)
    }
    
    func setDelegateTextField(){
        let textFieldDelegate = [userNameTextField, nameTextField, passwordTextField, confirmPasswordTextField]
        textFieldDelegate.forEach { $0?.delegate = self}
    }
}
