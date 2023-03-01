//
//  FollowDonationTableViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 27/02/2023.
//

import UIKit

class FollowDonationTableViewCell: UITableViewCell {
    
    static let identifierCell = "FollowDonationTableViewCell"
    
    @IBOutlet weak var followDonationStackView: UIStackView!
    @IBOutlet weak var viewFollowDonationConstrain: ViewWithAction!
    @IBOutlet weak var titleCaseLabel: UILabel!
    @IBOutlet weak var deliverytimeFirstLabel: UILabel!
    @IBOutlet weak var caseFollowDonationLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var deliveryDateLbel: UILabel!
    @IBOutlet weak var deliveryTimeSecondLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var sendImage: UIImageView!
    @IBOutlet weak var confirmImage: UIImageView!
    @IBOutlet weak var truckImage: UIImageView!
    @IBOutlet weak var doneImage: UIImageView!
    @IBOutlet weak var deliveredImage: UIImageView!
    @IBOutlet weak var secodFollowView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    private func isViewSelected(isSelected: Bool) {
        deliverytimeFirstLabel.isHidden = isSelected
        secodFollowView.isHidden = !isSelected
        arrowImage.image = isSelected ? .init(named: "arrow-up") : .init(named: "arrow-down")
        if isSelected {
            viewFollowDonationConstrain.borderWidth = 0
            followDonationStackView.borderWidth = 1.5
        }
    }

    func setFollowDonationData(donation: FollowDonation) {
        titleCaseLabel.text = donation.title
        deliverytimeFirstLabel.text = donation.deliveryTime
        deliveryTimeSecondLabel.text = donation.deliveryTime
        caseFollowDonationLabel.text = donation.caseFollowDonation
        deliveryDateLbel.text = donation.deliveryDate
        addressLabel.text = donation.address
        isViewSelected(isSelected: donation.isPressed!)
        titleCaseLabel.underline()
        checkCaseFollowDonation(caseDonation: donation.caseFollowDonation)
    }
    
    func checkCaseFollowDonation(caseDonation: String) {
        if caseDonation == "قيد الانتظار" {
            caseFollowDonationLabel.backgroundColor = UIColor(named: "OrangeBack")
            caseFollowDonationLabel.textColor = UIColor(named: "orangeTint")
        } else {
            caseFollowDonationLabel.backgroundColor = UIColor(named: "greenBack")
            caseFollowDonationLabel.textColor = UIColor(named: "greenTint")
        }
    }
    
}
