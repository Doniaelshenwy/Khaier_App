//
//  DeleteAccountViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 13/03/2023.
//

import UIKit

class DeleteAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func deleteButton(_ sender: Any) {
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم حذف الحساب بنجاح")
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: false)
    }
}
