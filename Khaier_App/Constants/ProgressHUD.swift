//
//  ProgressHUD.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 09/02/2023.
//

import ProgressHUD

class ProgressHUDIndicator {
    
    static func showLoadingIndicator(message: String = "", interaction: Bool = false) {
        ProgressHUD.show(message, interaction: interaction)
    }

    static func showLoadingIndicatorISSuccessfull(withMessage message: String, interaction: Bool = false) {
        colorProgress()
        ProgressHUD.showSucceed(message, interaction: interaction)
    }

    static func showLoadingIndicatorIsFailed(withErrorMessage message: String) {
        colorProgress()
        ProgressHUD.show(message, icon: AlertIcon.exclamation, interaction: false)
    }

    static func dismissLoadingIndictaor() {
        ProgressHUD.dismiss()
    }
    
    static func colorProgress(){
        ProgressHUD.colorAnimation = UIColor(named: "AppColor")!
        ProgressHUD.colorProgress = .gray
        ProgressHUD.colorStatus = UIColor(named: "AppColor")!
    }
    
}
