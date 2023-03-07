//
//  InformationZakatViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 07/03/2023.
//

import UIKit

class InformationZakatViewController: UIViewController {
    
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        changeColorOfWord(label: thirdLabel)
    }
    
    func changeColorOfWord(label: UILabel){
        
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: label.text!)
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "Secondary")!, range: NSRange(location: 5,length: 14))
        label.attributedText = myMutableString
    }
   
    @IBAction func informationView(_ sender: Any) {
        dismiss(animated: true)
    }

}
