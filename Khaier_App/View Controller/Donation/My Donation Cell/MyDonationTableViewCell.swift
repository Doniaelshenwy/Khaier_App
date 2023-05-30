//
//  MyDonationTableViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 27/02/2023.
//

import UIKit

class MyDonationTableViewCell: UITableViewCell {
    
    static let identifierCell = "MyDonationTableViewCell"
    
    @IBOutlet weak var titleCaseLabel: UILabel!
    @IBOutlet weak var remainDaysLabel: UILabel!
    @IBOutlet weak var donationPercentageLabel: UILabel!
    @IBOutlet weak var donationAgainButtonConstrain: UIButton!
    @IBOutlet weak var donationPercentageStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var donationAgainAction: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    private func checkDonationPercentage(percentage: OldCase){
        if percentage.percentage == 100 {
            donationAgainButtonConstrain.setDisable()
            donationPercentageStackView.isHidden = true
        } else {
            donationPercentageLabel.text = "%\(percentage.percentage ?? 0)"
        }
    }
    
    func setMyDonationData(donation: OldCase){
        titleCaseLabel.underline()
        titleCaseLabel.text = donation.title
        remainDaysLabel.text = "متبقي \(donation.remainingDays ?? 0) يوم"
        progressView.progress = Float(donation.percentage ?? 0) / 100
        checkDonationPercentage(percentage: donation)
    }

    @IBAction func donationAgainButton(_ sender: Any) {
        donationAgainAction?()
    }
    
}
