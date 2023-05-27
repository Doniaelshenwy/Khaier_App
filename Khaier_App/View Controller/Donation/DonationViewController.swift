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
    @IBOutlet weak var donationTableView: UITableView!
    @IBOutlet weak var emptyImage: UIImageView!
    @IBOutlet weak var emptyView: UIView!
    
    var myDonationArray: [MyDonation] = []
    var followDonationArray: [DonatedCase] = []
    var donationType: DonationType = .myDonation
    let apiRequest: DonationTrackingAPIProtocol = DonationTrackingAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        //setDataOfMyDonationArray()
        setDonationTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isHidenEmptyViewMyDonationArray()
        donationTrackingRequest()
    }
    
    func isHidenEmptyViewMyDonationArray() {
        if myDonationArray.count == 0 {
            emptyView.isHidden = false
            emptyImage.image = UIImage(named: "My Donation")
        } else {
            emptyView.isHidden = true
        }
    }
    
    func isHidenEmptyViewFollowDonationArray() {
        if followDonationArray.count == 0 {
            emptyView.isHidden = false
            emptyImage.image = UIImage(named: "follow Donation")
        } else {
            emptyView.isHidden = true
        }
    }
    
    private func donationTrackingRequest() {
        apiRequest.donationDetailsRequest { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let donationTracking = data?.donatedCases {
                    self.followDonationArray = donationTracking
                    self.donationTableView.reloadData()
                }
            case .failure(_):
                break
            }
        }
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
        chooseCellTableView()
        isHidenEmptyViewMyDonationArray()
    }
    
    @IBAction func followDonationButton(_ sender: Any) {
        donationType = .followDonation
        changeColorOfSelectedButton(isSelectedButton: followDonationBtnConstrain)
        changeColorOfNotSelectedButton(notSelectedButton: mydonationBtnConstrain)
        chooseCellTableView()
        isHidenEmptyViewFollowDonationArray()
    }
    
    @IBAction func moveToHomeVcButton(_ sender: Any) {
        moveToHomeVC()
    }
}

extension DonationViewController: TableViewConfig {
    
    private func checkDonationType() -> Int{
        switch donationType{
        case .myDonation:
            return myDonationArray.count
        case .followDonation:
            return followDonationArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkDonationType()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if donationType == .myDonation{
            let cell = tableView.dequeueReusableCell(withIdentifier: MyDonationTableViewCell.identifierCell, for: indexPath) as! MyDonationTableViewCell
            cell.setMyDonationData(donation: myDonationArray[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FollowDonationTableViewCell.identifierCell, for: indexPath) as! FollowDonationTableViewCell
            cell.setFollowDonationData(donation: followDonationArray[indexPath.row])
            cell.viewFollowDonationConstrain.addAction = { [weak self] in
                self?.followDonationArray[indexPath.row].isPressed?.toggle()
                self?.donationTableView.reloadData()
                cell.viewFollowDonationConstrain.borderWidth = 0
                cell.followDonationStackView.borderWidth = 1.5
            }
            return cell
        }
    }
    
    @objc func viewAction(indexPath: IndexPath) {
        
    }
    
    func chooseCellTableView() {
        if donationType == .myDonation{
            donationTableView.registerCellNib(cellClass: MyDonationTableViewCell.self)
            donationTableView.reloadData()
        } else {
            donationTableView.registerCellNib(cellClass: FollowDonationTableViewCell.self)
            donationTableView.reloadData()
        }
    }
    
    func setDonationTableView() {
        donationTableView.delegate = self
        donationTableView.dataSource = self
        chooseCellTableView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch donationType {
        case .myDonation:
            return 110
        case .followDonation:
            let height = followDonationArray[indexPath.row].isPressed
            if height == true {
                return 265
            } else {
                return 90
            }
        }
    }
}
