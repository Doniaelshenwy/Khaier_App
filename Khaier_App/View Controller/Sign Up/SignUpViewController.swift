//
//  SignUpViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 06/02/2023.
//

import UIKit

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
    
    func checkPhoneTF(){
        guard let phone = phoneTextField.text, phone != "" else {
            setRedColorTF(phoneTextField)
            showLabel(heightConstrain: phoneErrorHeightConstrain, v: view, repeatLabel: enterPhoneLabel)
            return
        }
        let vc = OTPViewController()
        vc.phone = phone
        push(vc: vc)
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
