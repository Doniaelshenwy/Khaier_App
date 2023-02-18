//
//  HomeViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/02/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var helloNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priorityCollectionView: UICollectionView!
    @IBOutlet weak var nearCollectionView: UICollectionView!
    
    var priorityArray: [PriorityModel] = []
    var nearArray: [NearModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        setCollectionView()
        setDataOfPriorityArray()
        setDataOfNearArray()


        
    }

    func setDataOfPriorityArray(){
        priorityArray = [
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
        ]
    }
    
    func setDataOfNearArray(){
        nearArray = [
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري..."),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري..."),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري..."),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري..."),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري..."),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري...")
        ]
    }
  
    @IBAction func bookmarkDonationBtn(_ sender: Any) {
        
    }
    
    @IBAction func medecineView(_ sender: Any) {
        
    }
    
    @IBAction func foodView(_ sender: Any) {
        
    }
    
    @IBAction func clothesView(_ sender: Any) {
        
    }
    
    @IBAction func allView(_ sender: Any) {
        
    }
    
    @IBAction func searchView(_ sender: Any) {
        let vc = SearchViewController()
        push(vc: vc)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case priorityCollectionView:
            return CGSize(width: 220, height: 268)
        case nearCollectionView:
            return CGSize(width: 220, height: 244)
        default:
            break
        }
        return CGSize(width: 0, height: 0)
    }
}
