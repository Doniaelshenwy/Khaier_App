//
//  ExitViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 13/03/2023.
//

import UIKit

class ExitViewController: UIViewController {
    
    private weak var delegate: LogoutProtocol!
    
    init(delegate: LogoutProtocol){
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(false)
        isTabBarHidden(true)
    }

    @IBAction func exitButton(_ sender: Any) {
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم تسجيل الخروج")
        dismiss(animated: true)
        delegate.movetoLoginVCFromExitVC()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: false)
    }
}
