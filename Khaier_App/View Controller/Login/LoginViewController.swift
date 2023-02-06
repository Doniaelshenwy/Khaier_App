//
//  LoginViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    static let identifier = "LoginViewController"
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var googleLoginBtnOutlet: UIButton!
    @IBOutlet weak var facebookLoginBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBorderColor()
        removeBorder()
    }
    
    func changeBorderColor(){
        phoneTextField.layer.borderColor = UIColor(named: "disapleColor")?.cgColor
        passwordView.layer.borderColor = UIColor(named: "disapleColor")?.cgColor
        googleLoginBtnOutlet.layer.borderColor = UIColor(named: "disapleColor")?.cgColor
        facebookLoginBtnOutlet.layer.borderColor = UIColor(named: "disapleColor")?.cgColor

    }
    
    func removeBorder(){
        passwordTextField.borderStyle = .none
    }

    @IBAction func rememberMeBtn(_ sender: UIButton) {
    }
    @IBAction func showHidenPasswordBtn(_ sender: Any) {
    }
    
    @IBAction func forgetPasswordBtn(_ sender: UIButton) {
    }
    
    @IBAction func loginBtn(_ sender: Any) {
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
    }
    
    
}
