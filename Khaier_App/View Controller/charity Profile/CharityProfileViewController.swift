//
//  CharityProfileViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/04/2023.
//

import UIKit

class CharityProfileViewController: UIViewController {
    
    @IBOutlet weak var charityDescriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIControl!
    
    @IBOutlet weak var donationsCategoryCollectionView: UICollectionView!
    @IBOutlet weak var caseDonationCollectionView: UICollectionView!
    @IBOutlet weak var urgentCasesCollectionView: UICollectionView!
    @IBOutlet weak var achievementCollectionView: UICollectionView!
    @IBOutlet weak var caseDonationCollectionViewHeightConstrain: NSLayoutConstraint!
    
    var showMore = false
    var donationsCategoryId: Int?

    var categoryArray: [DonationCategoryModel] = []
    var caseDonationArray: [Case] = []
    var urgentCasesArray: [Case] = []
    var achievementArray: [Case] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setDataOfCharityDescription()
        setCollectionView()
        setZeroOfHeightOfCollectionView()
//        setDataOfCaseDonationArray()
//        setDataOfUrgentCasesArray()
//        setDataOfAchievementArray()
        setDataOfcategoryArray()
    }
    
    func setDataOfcategoryArray() {
        categoryArray = [
        DonationCategoryModel(name: "الكل", isSelected: false),
        DonationCategoryModel(name: "ملابس", isSelected: false),
        DonationCategoryModel(name: "الطعام", isSelected: false),
        DonationCategoryModel(name: "أدوية", isSelected: false),
        DonationCategoryModel(name: "ورق", isSelected: false),
        DonationCategoryModel(name: "بلاستيك", isSelected: false),
        DonationCategoryModel(name: "ألعاب أطفال", isSelected: false),
        DonationCategoryModel(name: "أثاث", isSelected: false)
        ]
    }
    
//    func setDataOfCaseDonationArray(){
//        caseDonationArray = [
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
//        ]
//    }
//
//    func setDataOfUrgentCasesArray(){
//        urgentCasesArray = [
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
//        ]
//    }
//
//    func setDataOfAchievementArray(){
//        achievementArray = [
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
//        ]
//    }
    
    
    func setDataOfCharityDescription() {
        colorOfLabelText(label: charityDescriptionLabel, description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري")
    }
    
    func setZeroOfHeightOfCollectionView() {
        caseDonationCollectionViewHeightConstrain.constant = 0
    }
    
    func hideCollectionView(heightInvalidCollectionView: NSLayoutConstraint, invalidCollectionView: UICollectionView){
        heightInvalidCollectionView.constant = 0
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
            invalidCollectionView.alpha = 0
        } completion: { _ in
            invalidCollectionView.isHidden = true
        }
    }
    
    func showCollectinView(heightInvalidCollectionView: NSLayoutConstraint, invalidCollectionView: UICollectionView){
        invalidCollectionView.isHidden = false
        heightInvalidCollectionView.constant = 268
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
            invalidCollectionView.alpha = 1
        }
    }
    
    
    
    @IBAction func readMoreDescriptionCharity(_ sender: Any) {
        if showMore == false {
        UIView.animate(withDuration: 1) {
            self.charityDescriptionLabel.text = "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريا الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي ي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــالخــــيريالخــــيري ي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريا الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبيالطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخـــ الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريا الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــالخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي ي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــالخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري لخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي ي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــالخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري."
        }
            showMore.toggle()
        } else {
            UIView.animate(withDuration: 100) {

                self.colorOfLabelText(label: self.charityDescriptionLabel, description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري")
                self.charityDescriptionLabel.layoutIfNeeded()
            }
            showMore.toggle()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
}


extension CharityProfileViewController: CollectionViewConfig{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case donationsCategoryCollectionView :
            return categoryArray.count
        case caseDonationCollectionView:
            return caseDonationArray.count
        case urgentCasesCollectionView :
            return urgentCasesArray.count
        case achievementCollectionView:
            return achievementArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == donationsCategoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationsCategoryCollectionViewCell.identifierCell, for: indexPath) as! DonationsCategoryCollectionViewCell
//            cell.nameCategoryLabel.text = categoryArray[indexPath.row]
            cell.setDataOfDonationCategoryCell(category: categoryArray[indexPath.row])
            return cell
        } else if collectionView == caseDonationCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationCaseCollectionViewCell.identifierCell, for: indexPath) as! DonationCaseCollectionViewCell
            cell.setCaseData(priority: caseDonationArray[indexPath.row], isHidedonationDone: true, isEnabledDonateNow: true)
            return cell
        }  else if collectionView == urgentCasesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationCaseCollectionViewCell.identifierCell, for: indexPath) as! DonationCaseCollectionViewCell
            cell.setCaseData(priority: urgentCasesArray[indexPath.row], isHidedonationDone: true, isEnabledDonateNow: true)
            return cell
        }  else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationCaseCollectionViewCell.identifierCell, for: indexPath) as! DonationCaseCollectionViewCell
            cell.setCaseData(priority: achievementArray[indexPath.row], isHidedonationDone: false, isEnabledDonateNow: false)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoryArray.forEach{$0.isSelected = false}
        if indexPath.row == donationsCategoryId {
            hideCollectionView(heightInvalidCollectionView: caseDonationCollectionViewHeightConstrain, invalidCollectionView: caseDonationCollectionView)
            donationsCategoryId = nil
        } else {
            categoryArray[indexPath.row].isSelected?.toggle()
            showCollectinView(heightInvalidCollectionView: caseDonationCollectionViewHeightConstrain, invalidCollectionView: caseDonationCollectionView)
            donationsCategoryId = indexPath.row
        }
        donationsCategoryCollectionView.reloadData()
    }
    
    func setCollectionView() {
        [donationsCategoryCollectionView, caseDonationCollectionView, urgentCasesCollectionView, achievementCollectionView].forEach { $0?.delegate = self }
        [donationsCategoryCollectionView, caseDonationCollectionView, urgentCasesCollectionView, achievementCollectionView].forEach { $0?.dataSource = self }
        donationsCategoryCollectionView.register(cells: [DonationsCategoryCollectionViewCell.self])
        caseDonationCollectionView.register(cells: [DonationCaseCollectionViewCell.self])
        urgentCasesCollectionView.register(cells: [DonationCaseCollectionViewCell.self])
        achievementCollectionView.register(cells: [DonationCaseCollectionViewCell.self])
    }
    
}

extension CharityProfileViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case donationsCategoryCollectionView:
            return CGSize(width: 80, height: 32)
        case caseDonationCollectionView, urgentCasesCollectionView, achievementCollectionView:
            return CGSize(width: 220, height: 268)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
}
