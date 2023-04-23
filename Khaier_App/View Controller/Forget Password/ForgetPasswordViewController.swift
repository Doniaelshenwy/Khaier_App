//
//  ForgetPasswordViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 07/02/2023.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var repeatEnterPhoneLabel: UILabel!
    @IBOutlet weak var repeatEnterPhoneLabelConstrain: NSLayoutConstraint!
    
    let apiRequest: AuthAPIProtocol = AuthAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.delegate = self
        isHiddeninvalidLabel(for: [repeatEnterPhoneLabel])
        setZeroHeightLabel(for: [repeatEnterPhoneLabelConstrain])
    }
    
    func verifyPhoneForgetPasswordRequest(phoneNumber: String) {
        let model = VerifyPhoneRequestModel(phone_number: phoneNumber)
        apiRequest.verifyPhoneForgetPasswordRequest(model: model) { response in
            switch response {
            case .success(let data):
                if (data?.success == "denied") {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: (data?.error?.phoneNumber?[0]) ?? "")
                } else if (data?.success == "accepted") {
                    print(":ok")
                    self.moveToOTPForgetPasswordVC(phone: phoneNumber)
                }
            case .failure(_):
                print("errrr")
                break
            }
        }
    }
    
    func moveToOTPForgetPasswordVC(phone: String){
        let vc = OTPForgetPasswordViewController()
        vc.phone = phone
        push(vc: vc)
    }
    
    func callSendCode(phone: String){
        let number = "+2\(phone)"
        AuthManager.shared.startAuth(phoneNumber: number) { [weak self] state in
            switch state{
            case true:
                self?.verifyPhoneForgetPasswordRequest(phoneNumber: phone)
            case false:
                ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: " رقم الهاتف غير صحيح يرجي ادخاله مره أخري")
            }
        }
    }
    
    func checkPhoneTF(){
        guard let phone = phoneTextField.text, phone != "" else {
            checkTextFieldIsEmpty(textField: phoneTextField, height: repeatEnterPhoneLabelConstrain, label: repeatEnterPhoneLabel)
            return
        }
        verifyPhoneForgetPasswordRequest(phoneNumber: phone)
        //moveToOTPForgetPasswordVC(phone: phone)    // test
        //callSendCode(phone: phone)   // use firebase
    }

    @IBAction func sendCodeBtn(_ sender: Any) {
        checkPhoneTF()
    }
    
}


