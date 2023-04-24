//
//  ThanksDonationViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 23/04/2023.
//

import UIKit

class ThanksDonationViewController: UIViewController {
    
    private weak var delegate: ThanksDonationProtocol!
    
    init(delegate: ThanksDonationProtocol){
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
    }

    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func moveToHomeVCButton(_ sender: Any) {
        dismiss(animated: false)
        delegate.movetoHomeVCFromThanksDonation()
    }
}
