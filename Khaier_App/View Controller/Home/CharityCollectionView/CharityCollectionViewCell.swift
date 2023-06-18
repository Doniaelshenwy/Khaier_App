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
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Bool?
    var userId : Int?
    var charityId : Int?
    
    func checkBookmark(bookmarkId: Bool) {
        bookmarkId == false ? saveCharityButtonConstrain.setImage("save") : saveCharityButtonConstrain.setImage("save-fill")
    }
    
    func setCharityData(near charity: Charity){
        //image.image = UIImage(named: "Charities")
        image.setImageKF(urlImage: charity.thumbnail ?? Constant.placeHolder)
        title.text = charity.name
        addressLabel.text = charity.address
        colorOfLabelText(label: descriptionLabel, description: charity.excerpt ?? "")
        checkBookmark(bookmarkId: charity.bookmarked ?? false )
        bookmarkId = charity.bookmarked
        userId = charity.userID
        charityId = charity.id
    }
    
    func editCharityBookmarkRequest(id: Int) {
        apiRequest.editCharityBookmarkRequest(id: id) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let message = data?.message {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                    if message.contains("اضافة") {
                        self.saveCharityButtonConstrain.setImage("save-fill")
                    } else {
                        self.saveCharityButtonConstrain.setImage("save")
                    }
                } else {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: "هناك خطأ ما")
                }
            case .failure(_):
                break
            }
        }
    }

    @IBAction func saveCharityButton(_ sender: Any) {
        editCharityBookmarkRequest(id: charityId ?? 0)
    }
}
