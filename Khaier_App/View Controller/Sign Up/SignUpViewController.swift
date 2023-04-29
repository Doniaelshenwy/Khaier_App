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
    
    let apiRequest: AuthAPIProtocol = AuthAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setZeroHeightLabel(for: [phoneErrorHeightConstrain])
        isHiddeninvalidLabel(for: [enterPhoneLabel])
        phoneTextField.delegate = self
    }
    
    func verifyPhoneRegisterRequest(phoneNumber: String) {
        let model = VerifyPhoneRequestModel(phone_number: phoneNumber)
        apiRequest.verifyPhoneRegisterRequest(model: model) { response in
            switch response {
                
            case .success(let data):
                if let error = data?.error?.phoneNumber?[0] {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: error)
                } else {
                    self.moveToOTPSignUPVC(phone: phoneNumber)
                    //self.callSendCode(phone: phoneNumber)
                }
            case .failure(_):
                break
//                ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: error.localizedDescription)
            }
        }
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
               // self?.verifyPhoneRegisterRequest(phoneNumber: phone)
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
        //callSendCode(phone: phone) // when firebase send code
      //  moveToOTPSignUPVC(phone: phone) // test
        verifyPhoneRegisterRequest(phoneNumber: phone)
    }
   
    @IBAction func loginBtn(_ sender: Any) {
        moveToLoginVC()
    }
    @IBAction func sendCodeBtn(_ sender: Any) {
        checkPhoneTF()
    }
}


