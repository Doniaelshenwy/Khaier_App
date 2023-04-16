//
//  PaymentMethodViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 16/04/2023.
//

import UIKit

class PaymentMethodViewController: UIViewController {

    @IBOutlet weak var payPalButtonConstrain: UIButton!
    
    @IBOutlet weak var visaButtonConstrain: UIButton!
    
    @IBOutlet weak var masterCardButtonConstrain: UIButton!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var creditNumberTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backTOPaymentVc(_ sender: Any) {
    }
    
    @IBAction func visaButton(_ sender: UIButton) {
    }
    @IBAction func payPalButton(_ sender: UIButton) {
    }
    
    @IBAction func masterCardButton(_ sender: Any) {
    }
    
    @IBAction func confirmPayment(_ sender: Any) {
    }
    
}
