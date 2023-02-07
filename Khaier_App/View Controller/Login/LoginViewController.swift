//
//  LoginViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import UIKit

// Localization arabic only

class LoginViewController: UIViewController {
    
    static let identifier = "LoginViewController"
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var googleLoginBtnOutlet: UIButton!
    @IBOutlet weak var facebookLoginBtnOutlet: UIButton!
    @IBOutlet weak var showHidenPasswordBtnOutlet: UIButton!
    
    var passwordVisable = true
    var isRemember = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeBorder()
        let arr = [phoneTextField, passwordTextField]
        arr.forEach { $0?.delegate = self}
    }
    
    func removeBorder(){
        passwordTextField.borderStyle = .none
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

    @IBAction func rememberMeBtn(_ sender: UIButton) {
        isRemember.toggle()
        isRemember ? sender.setImage("fillCheck") : sender.setImage("check")
    }
    
    @IBAction func showHidenPasswordBtn(_ sender: Any) {
        checkPasswordVisiable()
    }
    
    @IBAction func forgetPasswordBtn(_ sender: UIButton) {
    }
    
    @IBAction func loginBtn(_ sender: Any) {
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
    
    func checkPhoneTF(){
        if phoneTextField.text == ""{
            setGrayColorTF(phoneTextField)
        } else {
            setAppColorTF(phoneTextField)
        }
    }
    
    func checkPasswordView(){
        if passwordTextField.text == ""{
            setGrayColorView(passwordView)
        } else {
            setAppColorView(passwordView)
        }
    }

    
}
