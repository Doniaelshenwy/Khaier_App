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
    var donationNowAction: (() -> ())?
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Int?
    var userId : Int?
    var charityId : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func checkBookmark(bookmarkId: Int) {
        bookmarkId == 0 ? saveCharityButtonConstrain.setImage("save") : saveCharityButtonConstrain.setImage("save-fill")
    }
    
    func setCharityData(near charity: Charity){
        image.image = UIImage(named: "Charities")
        title.text = charity.name
        addressLabel.text = charity.address
        colorOfLabelText(label: descriptionLabel, description: charity.excerpt ?? "")
        checkBookmark(bookmarkId: charity.bookmarkID ?? 0)
        bookmarkId = charity.bookmarkID
        userId = charity.userID
        charityId = charity.id
    }
    
    func addCharityBookmarkRequest(model: AddCharityRequestModel) {
        apiRequest.addCharityBookmarkRequest(model: model) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let errorUserId = data?.errors?.userID?[0] {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: errorUserId)
                } else if let errorCharityId = data?.errors?.charityID?[0] {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: errorCharityId)
                } else {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: data?.message ?? "")
                    self.saveCharityButtonConstrain.setImage("save-fill")
                }
            case .failure(_):
                break
            }
        }
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
        let model = AddCharityRequestModel(userId: userId, charityId: charityId)
        bookmarkId == 0 ? addCharityBookmarkRequest(model: model) : deleteCharityBookmarkRequest(bookmarkId: bookmarkId ?? 0)
    }
}
