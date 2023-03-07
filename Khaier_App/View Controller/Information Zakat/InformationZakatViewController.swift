//
//  InformationZakatViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 07/03/2023.
//

import UIKit

class InformationZakatViewController: UIViewController {

    @IBOutlet weak var detailsInformationZakatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        colorOfLabelText(label: detailsInformationZakatLabel, description: detailsInformationZakatLabel.text!)
    }
    
    func colorOfLabelText(label: UILabel, description: String){
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: String(description), attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "BlackColor")!]));
        text.append(NSAttributedString(string: "نقرأ في سورة البقرة \"وَأَقِيمُوا الصَّلَاةَ وَآتُوا الزَّكَاةَ وَمَا تُقَدِّمُوا لِأَنفُسِكُم مِّنْ خَيْرٍ تَجِدُوهُ عِندَ الله إِنَّ الله بِمَا تَعْمَلُونَ بَصِيرٌ \".", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppColor")!]))
        text.append(NSAttributedString(string: "خَـــيِّـــرْ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Secondary")!]))
        label.attributedText = text
    }
    
}
