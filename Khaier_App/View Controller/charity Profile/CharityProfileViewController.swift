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
    @IBOutlet weak var achievementCollectionView: UICollectionView!
    @IBOutlet weak var urgentCasesCollectionView: UICollectionView!
    @IBOutlet weak var caseDonationCollectionView: UICollectionView!
    
    var isSelected = false
    var categoryArray: [String] = ["الكل","ملابس","الطعام","أدوية","ورق","بلاستيك","ألعاب أطفال","أثاث"]

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        colorOfLabelText(label: charityDescriptionLabel, description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيري الخــــيري الطــــــــــبي الخــــيريالخــــيري الطــــــــــبي الخــــيري")
        setCollectionView()

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
//        switch collectionView {
//        case priorityCollectionView:
//            return priorityArray.count
//        case nearCollectionView:
//            return nearArray.count
//        default:
//            return 0
//        }
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationsCategoryCollectionViewCell.identifierCell, for: indexPath) as! DonationsCategoryCollectionViewCell
        cell.nameCategoryLabel.text = categoryArray[indexPath.row]
        return cell
        
        
        
//        if collectionView == priorityCollectionView{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriorityCollectionViewCell.identifierCell, for: indexPath) as! PriorityCollectionViewCell
//            cell.setCaseData(priority: priorityArray[indexPath.row])
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearCollectionViewCell.identifierCell, for: indexPath) as! NearCollectionViewCell
//            cell.setCharityData(near: nearArray[indexPath.row])
//            return cell
//        }
    }
    
    func setCollectionView(){
//        [priorityCollectionView, nearCollectionView].forEach { $0?.delegate = self }
//        [priorityCollectionView, nearCollectionView].forEach { $0?.dataSource = self }
//        priorityCollectionView.register(cells: [PriorityCollectionViewCell.self])
//        nearCollectionView.register(cells: [NearCollectionViewCell.self])
        
        donationsCategoryCollectionView.dataSource = self
        donationsCategoryCollectionView.delegate = self
        donationsCategoryCollectionView.register(cells: [DonationsCategoryCollectionViewCell.self])
    }
    
}

extension CharityProfileViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch collectionView {
//        case priorityCollectionView:
//            return CGSize(width: 220, height: 268)
//        case nearCollectionView:
//            return CGSize(width: 220, height: 244)
//        default:
//            return CGSize(width: 0, height: 0)
        return CGSize(width: 80, height: 32)
//        }
    }
    
}
