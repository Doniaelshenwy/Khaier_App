//
//  OTPForgetPasswordVC+ExtensionUITextFieldDelegate.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

extension OTPForgetPasswordViewController: UITextFieldDelegate{
    
    func setDelegateTextField(){
        let textFieldDelegate = [numberOneTextField, numberTwoTextField, numberThreeTextField, numberFourTextField, numberFiveTextField, numberSixTextField]
        textFieldDelegate.forEach { $0?.delegate = self}
        textFieldDelegate.forEach { $0?.addTarget(self, action: #selector(textDidChange), for: .editingChanged) }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        changeTextField(numberOneTextField)
        changeTextField(numberTwoTextField)
        changeTextField(numberThreeTextField)
        changeTextField(numberFourTextField)
        changeTextField(numberFiveTextField)
        changeTextField(numberSixTextField)
    }
    
    func changeTextField(_ textField: UITextField){
        if textField.text == ""{
            setGrayColorTF(textField)
        } else {
            setAppColorTF(textField)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          if textField == numberOneTextField && textField == numberTwoTextField && textField == numberThreeTextField && textField == numberFourTextField && textField == numberFiveTextField && textField == numberSixTextField{
              maxLength = 1
          }
          let currentString: NSString = textField.text! as NSString
          let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
          return newString.length <= maxLength
      }
}

