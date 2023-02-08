//
//  LoginViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import UIKit
import ProgressHUD
import SwiftUI

// Localization arabic only

class LoginViewController: UIViewController {
    
    static let identifier = "LoginViewController"
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var googleLoginBtnOutlet: UIButton!
    @IBOutlet weak var facebookLoginBtnOutlet: UIButton!
    @IBOutlet weak var showHidenPasswordBtnOutlet: UIButton!
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var repeatPhoneLabel: UILabel!
    @IBOutlet weak var passwordErrorHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var phoneErrorHeightConstrain: NSLayoutConstraint!
    
    var passwordVisable = true
    var isRemember = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isHiddenLabel()
        setZeroHeightLabel()
        removeBorder()
        let arr = [phoneTextField, passwordTextField]
        arr.forEach { $0?.delegate = self}
    }
    
    func removeBorder(){
        passwordTextField.borderStyle = .none
    }
    
    func setZeroHeightLabel(){
        passwordErrorHeightConstrain.constant = 0
        phoneErrorHeightConstrain.constant = 0
    }
    
    func isHiddenLabel(){
        repeatPasswordLabel.isHidden = true
        repeatPhoneLabel.isHidden = true
    }
    
    func checkPasswordVisiable(){
        passwordVisable ? showHidenPasswordBtnOutlet.setImage("eye") :             showHidenPasswordBtnOutlet.setImage("eye-off")
        passwordVisable.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    func moveToSignUpVC(){
        let vc = SignUpViewController()
        push(vc: vc)
    }
    
    func moveToForgetPasswordVC(){
        let vc = ForgetPasswordViewController()
        push(vc: vc)
    }
    
    func checkPhonePassword(phone: String, password: String){
        if phone == "01019434345" && password == "123"{
            ProgressHUD.showSucceed("👏🏻 مرحبا")
            if isRemember{
                UserDefaults.standard.set(isRemember, forKey: "isEnter")
            }
        } else {
            ProgressHUD.showFailed("يرجي ادخال الداتا بشكل صحيح")
        }
    }

    @IBAction func rememberMeBtn(_ sender: UIButton) {
        isRemember.toggle()
        isRemember ? sender.setImage("fillCheck") : sender.setImage("check")
    }
    
    @IBAction func showHidenPasswordBtn(_ sender: Any) {
        checkPasswordVisiable()
    }
    
    @IBAction func forgetPasswordBtn(_ sender: UIButton) {
        moveToForgetPasswordVC()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        guard let phone = phoneTextField.text, phone != "" else {
            setRedColorTF(phoneTextField)
            showLabel(heightConstrain: phoneErrorHeightConstrain, v: view, repeatLabel: repeatPhoneLabel)
            return }
        guard let password = passwordTextField.text, password != "" else {
            setRedColorView(passwordView)
            showLabel(heightConstrain: passwordErrorHeightConstrain, v: view, repeatLabel: repeatPasswordLabel)
            return }
        checkPhonePassword(phone: phone, password: password)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        moveToSignUpVC()
    }
}

extension LoginViewController : UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkPhoneTF()
        checkPasswordView()
    }
    
    func checkPhoneTF() {
        if phoneTextField.text == "" {
            setGrayColorTF(phoneTextField)
            hideLabel(heightConstrain: phoneErrorHeightConstrain, v: view, repeatLabel: repeatPhoneLabel)
        } else {
            setAppColorTF(phoneTextField)
            hideLabel(heightConstrain: phoneErrorHeightConstrain, v: view, repeatLabel: repeatPhoneLabel)
        }
    }
    
    func checkPasswordView() {
        if passwordTextField.text == "" {
            setGrayColorView(passwordView)
            hideLabel(heightConstrain: passwordErrorHeightConstrain, v: view, repeatLabel: repeatPasswordLabel)
        } else {
            setAppColorView(passwordView)
            hideLabel(heightConstrain: passwordErrorHeightConstrain, v: view, repeatLabel: repeatPasswordLabel)
        }
    }
}
