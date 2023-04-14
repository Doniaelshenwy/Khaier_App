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
    
    var isSelected = false
    var categoryArray: [String] = ["الكل","ملابس","الطعام","أدوية","ورق","بلاستيك","ألعاب أطفال","أثاث"]
    var caseDonationArray: [CaseDonationModel] = []
    var urgentCasesArray: [CaseDonationModel] = []
    var achievementArray: [CaseDonationModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setDataOfCharityDescription()
        setCollectionView()
       // setZeroOfHeightOfCollectionView()
        setDataOfCaseDonationArray()
        setDataOfUrgentCasesArray()
        setDataOfAchievementArray()
    }
    
    func setDataOfCaseDonationArray(){
        caseDonationArray = [
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
        ]
    }
    
    func setDataOfUrgentCasesArray(){
        urgentCasesArray = [
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
        ]
    }
    
    func setDataOfAchievementArray(){
        achievementArray = [
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
        ]
    }
    
    
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
        if isSelected == false {
        UIView.animate(withDuration: 1) {
            self.charityDescriptionLabel.text = "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريا الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي ي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــالخــــيريالخــــيري ي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريا الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبيالطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخـــ الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريا الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيريالطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــالخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي ي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــالخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري لخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي ي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــي...الطــــــــــبي الخــــيري الطــالخــــيريالخــــيري الطــــــــــبي الخــــيري...الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري."
        }
            isSelected.toggle()
        } else {
            UIView.animate(withDuration: 100) {

                self.colorOfLabelText(label: self.charityDescriptionLabel, description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري")
                self.charityDescriptionLabel.layoutIfNeeded()
            }
            isSelected.toggle()
        }
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
            cell.nameCategoryLabel.text = categoryArray[indexPath.row]
            return cell
        } else if collectionView == caseDonationCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationCaseCollectionViewCell.identifierCell, for: indexPath) as! DonationCaseCollectionViewCell
                cell.setCaseData(priority: caseDonationArray[indexPath.row])
            return cell
        }  else if collectionView == urgentCasesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationCaseCollectionViewCell.identifierCell, for: indexPath) as! DonationCaseCollectionViewCell
              cell.setCaseData(priority: urgentCasesArray[indexPath.row])
            return cell
        }  else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationCaseCollectionViewCell.identifierCell, for: indexPath) as! DonationCaseCollectionViewCell
            cell.setCaseData(priority: achievementArray[indexPath.row])
            return cell
        }
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
