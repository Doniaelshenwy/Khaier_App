//
//  OTPSignUPViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 08/02/2023.
//

import UIKit

class OTPSignUPViewController: UIViewController {
    
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
    
    func moveToAccountVC(){
        let vc = AccountViewController()
        push(vc: vc)
    }
    
    func setDatePhone(){
        phoneLabel.text = "+2\(phone.convertedDigitsToLocale(Locale(identifier: "EN")))"
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
                self?.moveToAccountVC()
                ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم ارسال الكود بنجاح")
            case false:
                ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: "خطأ اعد ادخال الكود")
            }
        }
    }
    
    func repeatCallSendCode(){
        let number = "+٢\(phone)"
        AuthManager.shared.startAuth(phoneNumber: number) { [weak self] state in
            switch state{
            case true:
                self?.repeatSendCodeBtnConstrain.isHidden = true
                ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم ارسال الكود")
            case false:
                ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: " رقم الهاتف غير صحيح يرجي ادخاله مره أخري")
            }
            self?.setTextFieldEmpty()
        }
    }

    @IBAction func modifyPhoneBtn(_ sender: Any) {
        moveToSignUpVC()
    }
    
    
    @IBAction func continueBtn(_ sender: Any) {
        let code = isEmptyCodeInTextField().convertedDigitsToLocale(Locale(identifier: "EN"))
       //callVerifyCode(code: code) // fireBase
        moveToAccountVC()  // test
    }
    
    
    @IBAction func repeatSendCodeBtn(_ sender: Any) {
        repeatCallSendCode()
    }
}
