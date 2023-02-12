//
//  OTPForgetPasswordVC+Extension.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit

extension OTPForgetPasswordViewController{

    func moveCursorForward(text: String, textField: UITextField){
        if text.count == 1{
            switch textField{
            case numberOneTextField:
                numberTwoTextField.becomeFirstResponder()
            case numberTwoTextField:
                numberThreeTextField.becomeFirstResponder()
            case numberThreeTextField:
                numberFourTextField.becomeFirstResponder()
            case numberFourTextField:
                numberFiveTextField.becomeFirstResponder()
            case numberFiveTextField:
                numberSixTextField.becomeFirstResponder()
            case numberSixTextField:
                numberSixTextField.becomeFirstResponder()
                self.view.endEditing(true)
            default:
                break
            }
        }
    }
    
    func moveCursorBack(text: String, textField: UITextField){
        if text.isEmpty{
            disableContinueButton()
            switch textField{
            case numberOneTextField:
                numberOneTextField.becomeFirstResponder()
            case numberTwoTextField:
                numberOneTextField.becomeFirstResponder()
            case numberThreeTextField:
                numberTwoTextField.becomeFirstResponder()
            case numberFourTextField:
                numberThreeTextField.becomeFirstResponder()
            case numberFiveTextField:
                numberFourTextField.becomeFirstResponder()
            case numberSixTextField:
                numberFiveTextField.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    func isEmptyCodeInTextField() -> String{
        guard let t1 = numberOneTextField.text, !t1.isEmpty else { return "" }
        guard let t2 = numberTwoTextField.text, !t2.isEmpty else { return "" }
        guard let t3 = numberThreeTextField.text, !t3.isEmpty else { return "" }
        guard let t4 = numberFourTextField.text, !t4.isEmpty else { return "" }
        guard let t5 = numberFiveTextField.text, !t5.isEmpty else { return "" }
        guard let t6 = numberSixTextField.text, !t6.isEmpty else { return "" }
        let code = "\(t1)\(t2)\(t3)\(t4)\(t5)\(t6)"
        return code
    }
    
    func isTextFieldFull(){
        guard let one = numberOneTextField.text else { return }
        guard let two = numberTwoTextField.text else { return }
        guard let three = numberThreeTextField.text else { return }
        guard let four = numberFourTextField.text else { return }
        guard let five = numberFiveTextField.text else { return }
        guard let six = numberSixTextField.text else { return }
        if !one.isEmpty && !two.isEmpty && !three.isEmpty && !four.isEmpty && !five.isEmpty && !six.isEmpty {
            enableContinueButton()
        }
    }
    
    func setTextFieldEmpty(){
        numberOneTextField.text = ""
        numberTwoTextField.text = ""
        numberThreeTextField.text = ""
        numberFourTextField.text = ""
        numberFiveTextField.text = ""
        numberSixTextField.text = ""
    }
    
    @objc func textDidChange(textField: UITextField){
        guard let text = textField.text else { return }
        moveCursorForward(text: text, textField: textField)
        moveCursorBack(text: text, textField: textField)
        isTextFieldFull()
    }
    
}
