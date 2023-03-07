//
//  CalculateZakatViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 07/03/2023.
//

import UIKit

class CalculateZakatViewController: UIViewController {

    @IBOutlet weak var EnterAmountTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
    }
    
    func moveToInformationZakatVC(){
        let vc = InformationZakatViewController()
        vc.modalPresentationStyle = .custom
        present(vc, animated: false, completion: nil)
    }
    
    func moveToZakatValueVC(){
        let vc = ZakatValueViewController()
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }

    @IBAction func CalculateButton(_ sender: Any) {
        moveToZakatValueVC()
    }
    
    @IBAction func imformationZakatButton(_ sender: Any) {
        moveToInformationZakatVC()
    }
    @IBAction func backToProfileVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
}
