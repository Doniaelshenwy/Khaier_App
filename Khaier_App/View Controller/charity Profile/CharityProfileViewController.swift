//
//  CharityProfileViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/04/2023.
//

import UIKit

//MARK: Changes++++++++
class CharityProfileViewController: UIViewController {
    
    @IBOutlet weak var charityImage: UIImageView!
    @IBOutlet weak var charityNameLabel: UILabel!
    @IBOutlet weak var charityAddressLabel: UILabel!
    @IBOutlet weak var charityDescriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIControl!
    @IBOutlet weak var urgentCasesHeaderLabel: UILabel!
    @IBOutlet weak var achievementHeaderLabel: UILabel!
    @IBOutlet weak var donationsCategoryCollectionView: UICollectionView!
    @IBOutlet weak var caseDonationCollectionView: UICollectionView!
    @IBOutlet weak var urgentCasesCollectionView: UICollectionView!
    @IBOutlet weak var achievementCollectionView: UICollectionView!
    @IBOutlet weak var caseDonationCollectionViewHeightConstrain: NSLayoutConstraint!
    
    private let apiRequest: CharitiesRequestProtocol = CharitiesRequest()
    private var id: Int
    private var showMore = false
    private var donationsCategoryId: Int?
    private var categoryArray: [DonationCategoryModel] = []
    private var caseDonationArray: [Case] = []
    private var urgentCasesArray: [Case] = []
    private var achievementArray: [Case] = []
    private var charityDescription = ""
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        getCharities()
        setCollectionView()
        setZeroOfHeightOfCollectionView()
        setDataOfcategoryArray()
    }
    
    private func setCharityData(data: Charity?) {
        charityDescription = data?.excerpt ?? ""
        charityImage.setImageKF(urlImage: data?.thumbnail ?? Constant.placeHolder)
        charityNameLabel.text = data?.name
        charityAddressLabel.text = data?.address
        setupCharityDesciption()
    }
    
    private func setUrgentCasesData(data: [Case]?) {
        if let data = data, !data.isEmpty {
            urgentCasesArray = data
            urgentCasesCollectionView.reloadData()
            [
                urgentCasesHeaderLabel,
                urgentCasesCollectionView
            ]
                .forEach { $0?.isHidden = false }
        }
    }
    
    private func setAchievementsData(data: [Case]?) {
        if let data = data, !data.isEmpty {
            achievementArray = data
            achievementCollectionView.reloadData()
            [
                achievementHeaderLabel,
                achievementCollectionView
            ]
                .forEach { $0?.isHidden = false }
        }
    }
    
    private func setCollectionViewsData(data: CharitiesResponseModel) {
        caseDonationArray = data.cases ?? []
        caseDonationCollectionView.reloadData()
        setUrgentCasesData(data: data.urgentCases)
      //  setAchievementsData(data: data.doneCases)
    }
    
    private func getCharities() {
        apiRequest.getCategorys(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                if let data = data {
                    self.setCharityData(data: data.charity)
                    self.setCollectionViewsData(data: data)
                }
            case .failure:
                break
            }
        }
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
    
    private func setupCharityDesciption() {
        if showMore {
            UIView.animate(withDuration: 1) {
                self.charityDescriptionLabel.text = self.charityDescription
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.colorOfLabelText(label: self.charityDescriptionLabel, description: self.charityDescription)
                self.charityDescriptionLabel.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
    @IBAction func didTapReadMore(_ sender: Any) {
        showMore.toggle()
        setupCharityDesciption()
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
        switch collectionView {
        case donationsCategoryCollectionView:
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
            
        case caseDonationCollectionView:
            let vc = DonationInViewController(id: caseDonationArray[indexPath.row].id ?? 0)
            push(vc: vc)
            
        case urgentCasesCollectionView:
            let vc = DonationInViewController(id: urgentCasesArray[indexPath.row].id ?? 0)
            push(vc: vc)
            
        case achievementCollectionView:
            let vc = DonationInViewController(id: achievementArray[indexPath.row].id ?? 0)
            push(vc: vc)
            
        default:
            break
            
        }
    }
    
    func setCollectionView() {
        [
            donationsCategoryCollectionView,
            caseDonationCollectionView,
            urgentCasesCollectionView,
            achievementCollectionView
        ].forEach {
            $0?.delegate = self
            $0?.dataSource = self
        }
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
