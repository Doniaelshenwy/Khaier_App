//
//  ExitViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 13/03/2023.
//

import UIKit

class ExitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(false)
        isTabBarHidden(true)
    }

    @IBAction func exitButton(_ sender: Any) {
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم تسجيل الخروج")
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: false)
    }
}
