//
//  ZakatValueViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 07/03/2023.
//

import UIKit

class ZakatValueViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    
    private weak var delegate: DonateNowProtocol!
    
    var zakatAmount = ""
    
    init(delegate: DonateNowProtocol){
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueLabel.text = zakatAmount
    }

    @IBAction func donateNowButton(_ sender: Any) {
        dismiss(animated: false)
        delegate.movetoHomeVCFromZakatValue()
    }
    
    @IBAction func zakatValueView(_ sender: Any) {
        dismiss(animated: true)
    }
}
