//
//  ExitViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 13/03/2023.
//

import UIKit

class ExitViewController: UIViewController {
    
    private weak var delegate: LogoutProtocol!
    let apiRequest: ProfileAPIProtocol = ProfileAPI()
    
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
    
    private func logoutRequest() {
        apiRequest.logoutProfileRequest { response in
            switch response {
            case .success(let data):
                if let message = data?.message {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                } else {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: "فشل في تسجيل الخروج")
                }
            case .failure(_):
                break
            }
        }
    }
    
    func logout() {
        logoutRequest()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
            keyWindow?.rootViewController = UINavigationController(rootViewController: LoginViewController())
            UIView.transition(with: keyWindow!, duration: 0.5, options: .curveEaseIn, animations: nil, completion: nil)
        }
    }

    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true)
        //delegate.movetoLoginVCFromExitVC()
        UserDefault.clearUserDefaults()
        logout()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: false)
    }
}
