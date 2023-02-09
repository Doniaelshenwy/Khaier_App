//
//  OTPViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 08/02/2023.
//

import UIKit
import ProgressHUD

class OTPViewController: UIViewController {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var repeatSendCodeBtnConstrain: UIButton!
    @IBOutlet weak var numberOneTextField: UITextField!
    @IBOutlet weak var numberTwoTextField: UITextField!
    @IBOutlet weak var numberThreeTextField: UITextField!
    @IBOutlet weak var numberFourTextField: UITextField!
    @IBOutlet weak var numberFiveTextField: UITextField!
    @IBOutlet weak var numberSixTextField: UITextField!
    @IBOutlet weak var continueBtnConstrain: UIButton!
    
    var phone = ""
    var maxLength = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repeatSendCodeBtnConstrain.isHidden = true
        repeatSendCodeBtnConstrain.alpha = 0
        continueBtnConstrain.isEnabled = false
        setDelegateTextField()
        Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: false)

    }
    
    @objc func fireTimer() {
        UIView.animate(withDuration: 1.0) {
            self.repeatSendCodeBtnConstrain.isHidden = false
            self.repeatSendCodeBtnConstrain.alpha = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDatePhone()
    }
    
    func moveToSignUpVC(){
        let vc = SignUpViewController()
        push(vc: vc)
    }
    
    func moveToAccountVC(){
        let vc = AccountViewController()
        push(vc: vc)
    }
    
    func setDatePhone(){
        phoneLabel.text = "+٢\(phone)"
    }
    
    func enableContinueButton(){
        continueBtnConstrain.backgroundColor = UIColor(named: "AppColor")
        continueBtnConstrain.isEnabled = true
    }
    
    func disableContinueButton(){
        continueBtnConstrain.backgroundColor = UIColor(named: "DisableColor")
        continueBtnConstrain.isEnabled = false
    }
    
    func callVerifyCode(code: String){
        AuthManager.shared.verifyCode(smsCode: code) { [weak self] state in
            switch state{
            case true:
                //self?.moveToAccountVC()
                ProgressHUD.showSucceed("تم ارسال الكود بنجاح")
            case false:
                ProgressHUD.showFailed("خطأ اعد ادخال الكود")
            }
        }
    }
    
    func repeatCallSendCode(){
        let number = "+٢\(phone)"
        AuthManager.shared.startAuth(phoneNumber: number) { [weak self] state in
            switch state{
            case true:
                self?.repeatSendCodeBtnConstrain.isHidden = true
                ProgressHUD.showSucceed("تم ارسال الكود")
            case false:
                ProgressHUD.showFailed(" رقم الهاتف غير صحيح يرجي ادخاله مره أخري")
            }
            self?.isTextFieldEmpty()
        }
    }

    @IBAction func modifyPhoneBtn(_ sender: Any) {
        moveToSignUpVC()
    }
    
    
    @IBAction func continueBtn(_ sender: Any) {
        let code = checkCode().convertedDigitsToLocale(Locale(identifier: "EN"))
        callVerifyCode(code: code)
        //moveToAccountVC()
    }
    
    
    @IBAction func repeatSendCodeBtn(_ sender: Any) {
        repeatCallSendCode()
    }
}

extension OTPViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        changeTextField(numberOneTextField)
        changeTextField(numberTwoTextField)
        changeTextField(numberThreeTextField)
        changeTextField(numberFourTextField)
        changeTextField(numberFiveTextField)
        changeTextField(numberSixTextField)
    }
    
    func setDelegateTextField(){
        let textFieldDelegate = [numberOneTextField, numberTwoTextField, numberThreeTextField, numberFourTextField, numberFiveTextField, numberSixTextField]
        textFieldDelegate.forEach { $0?.delegate = self}
        textFieldDelegate.forEach { $0?.addTarget(self, action: #selector(textDidChange), for: .editingChanged) }
    }
    
    func changeTextField(_ textField: UITextField){
        if textField.text == ""{
            setGrayColorTF(textField)
        } else {
            setAppColorTF(textField)
        }
    }
    
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
    
    func checkCode() -> String{
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
    
    func isTextFieldEmpty(){
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          if textField == numberOneTextField && textField == numberTwoTextField && textField == numberThreeTextField && textField == numberFourTextField && textField == numberFiveTextField && textField == numberSixTextField{
              maxLength = 1
          }
          let currentString: NSString = textField.text! as NSString
          let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
          return newString.length <= maxLength
      }
}
