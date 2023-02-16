//
//  ChangePasswordViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/02/2023.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    weak var delegate: ChangePasswordProtocol!
    
    init(delegate: ChangePasswordProtocol){
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func loginButton(_ sender: Any) {
            dismiss(animated: true)
            delegate.movetoLoginVCFromChangePassword()
    }
}
