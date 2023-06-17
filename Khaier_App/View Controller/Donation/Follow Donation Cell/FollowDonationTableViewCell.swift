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
    
    func setFollowDonationData(donation: DonatedCase) {
        titleCaseLabel.text = donation.title
        deliverytimeFirstLabel.text = "\(donation.startTime) to \(donation.endTime)"
        deliveryTimeSecondLabel.text = "\(donation.startTime) to \(donation.endTime)"
        deliveryDateLbel.text = donation.date
        addressLabel.text = donation.address
        isViewSelected(isSelected: donation.isPressed!)
        caseDonation(colorStatus: donation.colorStatus)
        donationTrack(deliveryStatus: donation.deliveryStatus)
        titleCaseLabel.underline()
    }
    
    private func caseDonation(colorStatus: Int) {
        if colorStatus == 2 {
            caseFollowDonationLabel.text = "تم التوصيل"
            caseFollowDonationLabel.backgroundColor = UIColor(named: "greenBack")
            caseFollowDonationLabel.textColor = UIColor(named: "greenTint")
        } else if colorStatus == 3 {
            caseFollowDonationLabel.text = "قيد الانتظار"
            caseFollowDonationLabel.backgroundColor = UIColor(named: "OrangeBack")
            caseFollowDonationLabel.textColor = UIColor(named: "orangeTint")
        }
    }
    
    private func donationTrack(deliveryStatus: Int) {
        if deliveryStatus == 1{
            sendImage.image = UIImage(named: "SendB")
            confirmImage.image = UIImage(named: "ConfirmW")
            truckImage.image = UIImage(named: "TrackW")
            doneImage.image = UIImage(named: "DoneW")
            deliveredImage.image = UIImage(named: "DeleviredW")
        } else if deliveryStatus == 2 {
            sendImage.image = UIImage(named: "SendW")
            confirmImage.image = UIImage(named: "ConfirmB")
            truckImage.image = UIImage(named: "TrackW")
            doneImage.image = UIImage(named: "DoneW")
            deliveredImage.image = UIImage(named: "DeleviredW")
        } else if deliveryStatus == 3 {
            sendImage.image = UIImage(named: "SendW")
            confirmImage.image = UIImage(named: "ConfirmW")
            truckImage.image = UIImage(named: "TrackB")
            doneImage.image = UIImage(named: "DoneW")
            deliveredImage.image = UIImage(named: "DeleviredW")
        } else if deliveryStatus == 4 {
            sendImage.image = UIImage(named: "SendW")
            confirmImage.image = UIImage(named: "ConfirmW")
            truckImage.image = UIImage(named: "TrackW")
            doneImage.image = UIImage(named: "DoneB")
            deliveredImage.image = UIImage(named: "DeleviredW")
        } else if deliveryStatus == 5 {
            sendImage.image = UIImage(named: "SendW")
            confirmImage.image = UIImage(named: "ConfirmW")
            truckImage.image = UIImage(named: "TrackW")
            doneImage.image = UIImage(named: "DoneW")
            deliveredImage.image = UIImage(named: "DeleviredB")
        }
    }
}
