//
//  DonationViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/02/2023.
//

import UIKit

class DonationViewController: UIViewController {

    @IBOutlet weak var mydonationBtnConstrain: UIButton!
    @IBOutlet weak var followDonationBtnConstrain: UIButton!
    @IBOutlet weak var donationCollectionView: UICollectionView!
    
    var myDonationArray: [MyDonation] = []
    var followDonationArray: [FollowDonation] = []
    var donationType: DonationType = .myDonation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        setDataOfMyDonationArray()
        setDonationCollectionView()

    }
    
    func setDataOfMyDonationArray(){
        myDonationArray = [
        MyDonation(titleCase: "ساعد ساره في العلاجساعد ساره في العلاج....", remainDays: "12", donationPercentage: "60"),
        MyDonation(titleCase: "ساعد ساره في العلاج ..", remainDays: "12", donationPercentage: "50"),
        MyDonation(titleCase: "ساعد ساره في العلاج..", remainDays: "12", donationPercentage: "10"),
        MyDonation(titleCase: "ساعد ساره في العلاج..", remainDays: "12", donationPercentage: "100"),
        MyDonation(titleCase: "ساعد ساره في العلاج..", remainDays: "12", donationPercentage: "70")
        ]
    }
    

    @IBAction func myDonationButton(_ sender: Any) {
        donationType = .myDonation
        changeColorOfSelectedButton(isSelectedButton: mydonationBtnConstrain)
        changeColorOfNotSelectedButton(notSelectedButton: followDonationBtnConstrain)
        chooseCellCollectionView()
    }
    
    @IBAction func followDonationButton(_ sender: Any) {
        donationType = .followDonation
        changeColorOfSelectedButton(isSelectedButton: followDonationBtnConstrain)
        changeColorOfNotSelectedButton(notSelectedButton: mydonationBtnConstrain)
        chooseCellCollectionView()
    }
}


extension DonationViewController: CollectionViewConfig{
    
    private func checkDonationType() -> Int{
        switch donationType{
        case .myDonation:
            return myDonationArray.count
        case .followDonation:
            return followDonationArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        checkDonationType()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if donationType == .myDonation{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyDonationCollectionViewCell.identifierCell, for: indexPath) as! MyDonationCollectionViewCell
            cell.setMyDonationData(donation: myDonationArray[indexPath.row])
            return cell
        }
        else if donationType == .followDonation {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowDonationCollectionViewCell.identifierCell, for: indexPath) as! FollowDonationCollectionViewCell
            cell.setFollowDonationData(donation: followDonationArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func chooseCellCollectionView(){
        if donationType == .myDonation{
            donationCollectionView.register(UINib(nibName: MyDonationCollectionViewCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: MyDonationCollectionViewCell.identifierCell)
            donationCollectionView.reloadData()
        }
        else if donationType == .followDonation{
            donationCollectionView.register(UINib(nibName: FollowDonationCollectionViewCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: FollowDonationCollectionViewCell.identifierCell)
            donationCollectionView.reloadData()
        }
    }
    
    func setDonationCollectionView(){
        donationCollectionView.delegate = self
        donationCollectionView.dataSource = self
        chooseCellCollectionView()
    }
}

extension DonationViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 95)
    }
}
