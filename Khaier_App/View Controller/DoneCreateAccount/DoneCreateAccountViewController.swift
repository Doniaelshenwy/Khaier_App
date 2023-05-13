//
//  DoneCreateAccountViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 13/05/2023.
//

import UIKit

class DoneCreateAccountViewController: UIViewController {

    weak var delegate: DoneCreateAccountProtocol!
    
    init(delegate: DoneCreateAccountProtocol){
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func continueButton(_ sender: Any) {
        dismiss(animated: true)
        delegate.movetoLoginVCFromCreateAccount()
    }
}
