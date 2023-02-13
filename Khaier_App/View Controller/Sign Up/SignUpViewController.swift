//
//  SignUpViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 06/02/2023.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneErrorHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var enterPhoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setZeroHeightLabel(for: [phoneErrorHeightConstrain])
        isHiddeninvalidLabel(for: [enterPhoneLabel])
        phoneTextField.delegate = self
    }
    
    func moveToOTPSignUPVC(phone: String){
        let vc = OTPSignUPViewController()
        vc.phone = phone
        push(vc: vc)
    }
    
    func callSendCode(phone: String){
        let number = "+2\(phone.convertedDigitsToLocale(Locale(identifier: "EN")))"
        AuthManager.shared.startAuth(phoneNumber: number) { [weak self] state in
            switch state{
            case true:
                self?.moveToOTPSignUPVC(phone: phone)
            case false:
                ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: " رقم الهاتف غير صحيح يرجي ادخاله مره أخري")
            }
        }
    }
    
    func checkPhoneTF(){
        guard let phone = phoneTextField.text, phone != "" else {
            checkTextFieldIsEmpty(textField: phoneTextField, height: phoneErrorHeightConstrain, label: enterPhoneLabel)
            return
        }
       // callSendCode(phone: phone) // when firebase send code
        moveToOTPSignUPVC(phone: phone) // test
    }
   
    @IBAction func loginBtn(_ sender: Any) {
        moveToLoginVC()
    }
    @IBAction func sendCodeBtn(_ sender: Any) {
        checkPhoneTF()
    }
}


