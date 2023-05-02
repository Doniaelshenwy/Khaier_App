//
//  NearCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 16/02/2023.
//

import UIKit

class CharityCollectionViewCell: UICollectionViewCell {
    static let identifierCell = "CharityCollectionViewCell"

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var saveCharityButtonConstrain: UIButton!

    var isRememberCharity = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCharityData(near charity: Charity){
        image.image = UIImage(named: "Charities")
        title.text = charity.name
        addressLabel.text = charity.address
        colorOfLabelText(label: descriptionLabel, description: charity.excerpt ?? "")
    }

    @IBAction func saveCharityButton(_ sender: Any) {
        checkSaveButtonIsAccept(isRemember: &isRememberCharity, button: saveCharityButtonConstrain)
    }
}



