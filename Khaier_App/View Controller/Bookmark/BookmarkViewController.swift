//
//  BookmarkViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 20/02/2023.
//

import UIKit

class BookmarkViewController: UIViewController {

    @IBOutlet weak var charityButtonConstrain: UIButton!
    @IBOutlet weak var donationButtonConstrain: UIButton!
    @IBOutlet weak var bookmarkCollectionView: UICollectionView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var descriptionEmptyViewLabel: UILabel!
    @IBOutlet weak var titleEmptyViewLabel: UILabel!
    
    var donationArray: [Case] = []
    var charityArray: [Charity] = []
    var bookmarkType : BookmarkType = .donation
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setBookmarkCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        casesRequest()
    }
    
    private func casesRequest() {
        apiRequest.casesBookmarkRequest { [weak self] response in
            print(response)
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let cases = data?.caseBookmarks {
                    self.donationArray = cases
                    self.bookmarkCollectionView.reloadData()
                    self.isHidenEmptyViewDonationArray()
                    print("count = \(self.donationArray.count)")
                } else {
                    self.isHidenEmptyViewDonationArray()
                }
            case .failure(_):
                break
            }
        }
    }
    
    private func charitiesRequest() {
        apiRequest.charitiesBookmarkRequest { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let charities = data?.charityBookmarks {
                    self.charityArray = charities
                    self.bookmarkCollectionView.reloadData()
                    self.isHidenEmptyViewCharityArray()
                } else {
                    self.isHidenEmptyViewCharityArray()
                }
            case .failure(_):
                break
            }
        }
    }
    
    func isHidenEmptyViewDonationArray() {
        if donationArray.count == 0 {
            emptyView.isHidden = false
            titleEmptyViewLabel.text = "لم تقم بحفظ اي حالة تبرع بعد !!"
            descriptionEmptyViewLabel.text = "تصفح الان حالات التبرع"
        } else {
            emptyView.isHidden = true
        }
    }
    
    func isHidenEmptyViewCharityArray() {
        if charityArray.count == 0 {
            emptyView.isHidden = false
            titleEmptyViewLabel.text = "لم تقم بحفظ اي جمعية بعد !!"
            descriptionEmptyViewLabel.text = "تصفح الان الجمعيات الخيرية"
        } else {
            emptyView.isHidden = true
        }
    }

    // if user press button, move to home screen
    @IBAction func backToHomeVCButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    
    // if user press button, show charity
    @IBAction func charityButtonAction(_ sender: Any) {
        bookmarkType = .charity
        changeColorOfSelectedButton(isSelectedButton: charityButtonConstrain)
        changeColorOfNotSelectedButton(notSelectedButton: donationButtonConstrain)
        setCell()
        charitiesRequest()
    }
    
    // if user press button, show case donation
    @IBAction func donationButtonAction(_ sender: Any) {
        bookmarkType = .donation
        changeColorOfSelectedButton(isSelectedButton: donationButtonConstrain)
        changeColorOfNotSelectedButton(notSelectedButton: charityButtonConstrain)
        setCell()
        casesRequest()
    }
    
    @IBAction func moveToHomeVCButton(_ sender: Any) {
        moveToHomeVC()
    }
}

extension BookmarkViewController: CollectionViewConfig {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch bookmarkType {
        case .donation:
            return donationArray.count
        case .charity:
            return charityArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if bookmarkType == .donation{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookmarkDonationCollectionViewCell.identifierCell, for: indexPath) as! BookmarkDonationCollectionViewCell
        cell.setDonationData(donation: donationArray[indexPath.row])
        return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookmarkCharityCollectionViewCell.identifierCell, for: indexPath) as! BookmarkCharityCollectionViewCell
            cell.setCharityData(charity: charityArray[indexPath.row])
            return cell
        }
    }
    
    func setCell() {
        switch bookmarkType {
        case .donation:
            bookmarkCollectionView.register(cells: [BookmarkDonationCollectionViewCell.self])
            bookmarkCollectionView.reloadData()
        case .charity:
            bookmarkCollectionView.register(cells: [BookmarkCharityCollectionViewCell.self])
            bookmarkCollectionView.reloadData()
        }
    }
    
    func setBookmarkCollectionView() {
        bookmarkCollectionView.delegate = self
        bookmarkCollectionView.dataSource = self
        setCell()
    }
    
}

extension BookmarkViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
    
}
