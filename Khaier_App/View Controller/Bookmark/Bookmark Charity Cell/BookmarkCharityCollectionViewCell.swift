//
//  BookmarkCharityCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 20/02/2023.
//

import UIKit

class BookmarkCharityCollectionViewCell: UICollectionViewCell {
    
    static let identifierCell = "BookmarkCharityCollectionViewCell"
    
    @IBOutlet weak var charityImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var saveCharityButtonConstrain: UIButton!
    
    var isRememberCharity = false

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCharityData(charity: Charity) {
        charityImage.image = UIImage(named: "charityBookmark")
        title.text = charity.name
        addressLabel.text = charity.address
        colorOfLabelText(label: descriptionLabel, description: charity.excerpt ?? "")
    }

    @IBAction func saveCharityButton(_ sender: Any) {
        checkSaveButtonIsAccept(isRemember: &isRememberCharity, button: saveCharityButtonConstrain)
    }
}

