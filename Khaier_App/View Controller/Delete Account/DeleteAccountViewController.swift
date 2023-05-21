//
//  DeleteAccountViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 13/03/2023.
//

import UIKit

class DeleteAccountViewController: UIViewController {
    
    let apiRequest: ProfileAPIProtocol = ProfileAPI()
    var userId = 0
    private weak var delegate: DeleteProtocol!
    
    init(delegate: DeleteProtocol){
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func deleteProfileRequest(userId: Int) {
        apiRequest.deleteProfileRequest(id: userId) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let message = data?.message {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                    self.dismiss(animated: false)
                    self.delegate.movetoSignUpVCFromDeleteAccountVC()
                }
            case .failure(_):
                break
            }
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        deleteProfileRequest(userId: userId)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: false)
    }
}
