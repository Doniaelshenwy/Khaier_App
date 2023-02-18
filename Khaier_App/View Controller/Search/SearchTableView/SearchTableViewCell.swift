//
//  SearchTableViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 18/02/2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    static let identifierCell = "SearchTableViewCell"
    
    @IBOutlet weak var imageCase: UIImageView!
    @IBOutlet weak var typeDonationLabel: UILabel!
    @IBOutlet weak var titleCaseLabel: UILabel!
    @IBOutlet weak var accessRatioLabel: UILabel!
    @IBOutlet weak var remainDaysLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCaseData(priority: PriorityModel){
        imageCase.image = UIImage(named: priority.image)
        titleCaseLabel.text = priority.title
        typeDonationLabel.text = priority.typeDonation
        remainDaysLabel.text = "متبقي \(priority.remainDays) يوم"
        accessRatioLabel.text = "%\(priority.accessRatio)"
        progressView.progress = Float(priority.accessRatio) / 100
    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
    }
}
