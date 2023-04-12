//
//  DonationInViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 10/04/2023.
//

import UIKit


class DonationInViewController: UIViewController {
    
    @IBOutlet weak var charityDescriptionLabel: UILabel!
    
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        colorOfLabelText(label: charityDescriptionLabel, description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري")
        

    }
    
    @IBAction func readMoreDescriptionCharity(_ sender: Any) {
        if isSelected == false {
        UIView.animate(withDuration: 1) {
            self.charityDescriptionLabel.text = "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي ي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــالخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري."
        }
            isSelected.toggle()
        } else {
            UIView.animate(withDuration: 0.6) {
                self.colorOfLabelText(label: self.charityDescriptionLabel, description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري")
            }

            isSelected.toggle()
        }
    }
    
    func colorOfLabelText(label: UILabel, description: String){
        let myString = description.prefix(800)
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: String(myString), attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "BlackColor")!]));
        text.append(NSAttributedString(string: "...المزيد", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppColor")!]))
        label.attributedText = text
    }
    
}
