//
//  OTPViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 08/02/2023.
//

import UIKit

class OTPViewController: UIViewController {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var repeatSendCodeLabel: UILabel!
    @IBOutlet weak var numberOneTextField: UITextField!
    @IBOutlet weak var numberTwoTextField: UITextField!
    @IBOutlet weak var numberThreeTextField: UITextField!
    @IBOutlet weak var numberFourTextField: UITextField!
    @IBOutlet weak var numberFiveTextField: UITextField!
    @IBOutlet weak var numberSixTextField: UITextField!
    @IBOutlet weak var continueBtnConstrain: UIButton!
    
    var phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repeatSendCodeLabel.isHidden = true
        continueBtnConstrain.isEnabled = false
        setDelegateTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDatePhone()
    }
    
    func moveToSignUpVC(){
        let vc = SignUpViewController()
        push(vc: vc)
    }
    
    func moveToCompleteSignUpVC(){
        let vc = CompleteSignUpViewController()
        push(vc: vc)
    }
    
    func setDatePhone(){
        phoneLabel.text = "+٢\(phone)"
    }
    
    func setDelegateTextField(){
        let textFieldDelegate = [numberOneTextField, numberTwoTextField, numberThreeTextField, numberFourTextField, numberFiveTextField, numberSixTextField]
        textFieldDelegate.forEach { $0?.delegate = self}
    }

    @IBAction func modifyPhoneBtn(_ sender: Any) {
        moveToSignUpVC()
    }
    
    
    @IBAction func continueBtn(_ sender: Any) {
        moveToCompleteSignUpVC()
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
    
    func changeTextField(_ textField: UITextField){
        if textField.text == ""{
            setGrayColorTF(textField)
        } else {
            setAppColorTF(textField)
        }
    }
}
