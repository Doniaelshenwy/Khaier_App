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
    
    var donationArray: [Case] = []
    var charityArray: [CharityModel] = []
    var bookmarkType : BookmarkType = .donation
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setBookmarkCollectionView()
        //setDataOfCharityArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // isHidenEmptyViewDonationArray()
        casesRequest()
        
    }
    
    func casesRequest() {
        apiRequest.bookmarkRequest { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                print("case = \(data?.caseBookmarks)")
                if let cases = data?.caseBookmarks {
                    self.donationArray = cases
                    self.bookmarkCollectionView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
    
    func isHidenEmptyViewDonationArray() {
        if donationArray.count == 0 {
            emptyView.isHidden = false
        } else {
            emptyView.isHidden = true
        }
    }
    
    func isHidenEmptyViewCharityArray() {
        if charityArray.count == 0 {
            emptyView.isHidden = false
        } else {
            emptyView.isHidden = true
        }
    }
    
    func setDataOfCharityArray(){
        charityArray = [
            CharityModel(image: "charityBookmark", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيير"),
            CharityModel(image: "charityBookmark", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخيير"),
            CharityModel(image: "charityBookmark", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخييير"),
            CharityModel(image: "charityBookmark", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخييير"),
            CharityModel(image: "charityBookmark", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير"),
            CharityModel(image: "charityBookmark", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخيييير")
            ]
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
        isHidenEmptyViewCharityArray()
    }
    
    // if user press button, show case donation
    @IBAction func donationButtonAction(_ sender: Any) {
        bookmarkType = .donation
        changeColorOfSelectedButton(isSelectedButton: donationButtonConstrain)
        changeColorOfNotSelectedButton(notSelectedButton: charityButtonConstrain)
        setCell()
        isHidenEmptyViewDonationArray()
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
