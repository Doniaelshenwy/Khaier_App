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
    var saveDonationAction: (() -> ())?
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Bool?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCharityData(charity: Charity) {
        saveCharityButtonConstrain.setImage("save-fill")
        //charityImage.image = UIImage(named: "charityBookmark")
        charityImage.setImageKF(urlImage: charity.thumbnail ?? "http://khaier-env.eba-ik9m9yfd.eu-north-1.elasticbeanstalk.com/storage/thumbnails/charity/sXXIK4hmvwE58LVD3rWQ6YXj4jctlE33HcfGDYzO.jpg")
        title.text = charity.name
        addressLabel.text = charity.address
        colorOfLabelText(label: descriptionLabel, description: charity.excerpt ?? "")
        bookmarkId = charity.bookmarked
    }
    
    @IBAction func saveCharityButton(_ sender: Any) {
        saveDonationAction?()
    }
}

