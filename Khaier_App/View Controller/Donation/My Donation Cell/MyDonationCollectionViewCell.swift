//
//  MyDonationCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 22/02/2023.
//

import UIKit

class MyDonationCollectionViewCell: UICollectionViewCell {
    
    static let identifierCell = "MyDonationCollectionViewCell"
    
    @IBOutlet weak var titleCaseLabel: UILabel!
    @IBOutlet weak var remainDaysLabel: UILabel!
    @IBOutlet weak var donationPercentageLabel: UILabel!
    @IBOutlet weak var donationAgainButtonConstrain: UIButton!
    @IBOutlet weak var donationPercentageStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func checkDonationPercentage(percentage: MyDonation){
        if percentage.donationPercentage == "100"{
            donationAgainButtonConstrain.setDisable()
            donationPercentageStackView.isHidden = true
        } else {
            donationPercentageLabel.text = "%\(percentage.donationPercentage)"
        }
    }
    
    func setMyDonationData(donation: MyDonation){
        titleCaseLabel.underline()
        titleCaseLabel.text = donation.titleCase
        remainDaysLabel.text = "متبقي \(donation.remainDays) يوم"
        checkDonationPercentage(percentage: donation)
    }

    @IBAction func donationAgainButton(_ sender: Any) {
    }
}

