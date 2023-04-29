//
//  LoginViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
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
    @IBOutlet weak var checkRemeberBoxBtnConstrain: UIButton!
    @IBOutlet weak var phoneView: UIView!
    
    var passwordVisable = true
    var isRemember = false
    var maxLength = 11
    var secureTextFiled: SecureTextField?
    let apiRequest: AuthAPIProtocol = AuthAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        isNavigationHidden(true)
        isHiddeninvalidLabel(for: [repeatPhoneLabel, repeatPasswordLabel])
        setZeroHeightLabel(for: [phoneErrorHeightConstrain, passwordErrorHeightConstrain])
        secureTextFiled = SecureTextField(button: showHidenPasswordBtnOutlet, textField: passwordTextField)
        [phoneTextField, passwordTextField].forEach { $0?.delegate = self}
    }
    
    func moveToForgetPasswordVC(){
        let vc = ForgetPasswordViewController()
        push(vc: vc)
    }
    
    func loginRequest(phoneNumber: String, password: String) {
        
        let loginModel = AuthRequestModel(phoneNumber: phoneNumber, password: password)
        apiRequest.loginRequest(model: loginModel) { response in
            switch response {
            case .success(let data):
                if let error = data?.error {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: error)
                } else {
                    UserDefault.saveUserName(data?.user?.name ?? "")
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "👏🏻 مرحبا")
                    if self.isRemember{
                        UserDefault.saveReminder(self.isRemember)
                    }
                    self.moveToHomeVC()
                } 
            case .failure(_):
                break
//                ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: error.localizedDescription)
//                print("eroooooooor")
            }
        }
    }
    
//    func checkPhonePassword(phone: String, password: String){
//        let convertPhoneArabic = phone.convertedDigitsToLocale(Locale(identifier: "AR"))
//        let convertPasswordArabic = password.convertedDigitsToLocale(Locale(identifier: "AR"))
//        if convertPhoneArabic == "٠١٠١٩٤٣٤٣٤٥" && convertPasswordArabic == "١٢٣"{
//            ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "👏🏻 مرحبا")
//            moveToHomeVC()
//            if isRemember{
//                UserDefaults.standard.set(isRemember, forKey: "isEnter")
//            }
//        } else {
//            ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: "يرجي ادخال البيانات بشكل صحيح")
//        }
//    }

    @IBAction func rememberMeBtn(_ sender: UIButton) {
        checkBoxIsAccept(isRemember: &isRemember, button: checkRemeberBoxBtnConstrain)
    }
    
    @IBAction func showHidenPasswordBtn(_ sender: Any) {
        secureTextFiled?.checkPasswordVisiable(visable: &passwordVisable)
    }
    
    @IBAction func forgetPasswordBtn(_ sender: UIButton) {
        moveToForgetPasswordVC()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        guard let phone = phoneTextField.text, phone != "" else {
            checkViewIsEmpty(view: phoneView, height: phoneErrorHeightConstrain, label: repeatPhoneLabel)
            return }
        guard let password = passwordTextField.text, password != "" else {
            checkViewIsEmpty(view: passwordView, height: passwordErrorHeightConstrain, label: repeatPasswordLabel)
            return }
        loginRequest(phoneNumber: phone, password: password)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        moveToSignUpVC()
    }
    
}

