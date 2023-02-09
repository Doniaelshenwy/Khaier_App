//
//  SignUpViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 06/02/2023.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import ProgressHUD

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneErrorHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var enterPhoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterPhoneLabel.isHidden = true
        phoneErrorHeightConstrain.constant = 0
        phoneTextField.delegate = self
    }
    
    func moveToLoginVC(){
        let vc = LoginViewController()
        push(vc: vc)
    }
    
    func moveToOTPVC(phone: String){
        let vc = OTPViewController()
        vc.phone = phone
        push(vc: vc)
    }
    
    func callSendCode(phone: String){
        let number = "+٢\(phone)"
        AuthManager.shared.startAuth(phoneNumber: number) { [weak self] state in
            switch state{
            case true:
                self?.moveToOTPVC(phone: phone)
            case false:
                ProgressHUD.showFailed(" رقم الهاتف غير صحيح يرجي ادخاله مره أخري")
            }
        }
    }
    
    func checkPhoneTF(){
        guard let phone = phoneTextField.text, phone != "" else {
            setRedColorTF(phoneTextField)
            showLabel(heightConstrain: phoneErrorHeightConstrain, v: view, repeatLabel: enterPhoneLabel)
            return
        }
        callSendCode(phone: phone) // when firebase send code
        //moveToOTPVC(phone: phone)
    }
   
    @IBAction func loginBtn(_ sender: Any) {
        moveToLoginVC()
    }
    @IBAction func sendCodeBtn(_ sender: Any) {
        checkPhoneTF()
    }
}

extension SignUpViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        changePhoneTF()
    }
    
    func changePhoneTF(){
        if phoneTextField.text == ""{
            setGrayColorTF(phoneTextField)
            hideLabel(heightConstrain: phoneErrorHeightConstrain, v: view, repeatLabel: enterPhoneLabel)
        } else {
            setAppColorTF(phoneTextField)
            hideLabel(heightConstrain: phoneErrorHeightConstrain, v: view, repeatLabel: enterPhoneLabel)
        }
    }
}
