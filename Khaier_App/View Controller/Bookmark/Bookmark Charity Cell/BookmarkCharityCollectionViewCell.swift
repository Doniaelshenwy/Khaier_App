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
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCharityData(charity: Charity) {
        charityImage.image = UIImage(named: "charityBookmark")
        title.text = charity.name
        addressLabel.text = charity.address
        colorOfLabelText(label: descriptionLabel, description: charity.excerpt ?? "")
        bookmarkId = charity.bookmarkID
    }
    
    func deleteCharityBookmarkRequest(bookmarkId: Int) {
        apiRequest.deleteCharityBookmarkRequest(id: bookmarkId) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let message = data?.message {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                    self.saveCharityButtonConstrain.setImage("save")
                } else {
                    print("not delete")
                }
            case .failure(_):
                break
            }
        }
    }

    @IBAction func saveCharityButton(_ sender: Any) {
        deleteCharityBookmarkRequest(bookmarkId: bookmarkId ?? 0)
    }
}

