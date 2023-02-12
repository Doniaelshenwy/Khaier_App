//
//  OnboardingViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var loginBtnOutlet: UIButton!
    @IBOutlet weak var signUpBtnOutlet: UIButton!
    
    var onBoardingArray: [OnboardingModel] = []
    var currentPage = 2 {
        didSet{
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDataOfonBoardingArray()
    }
    
    func setDataOfonBoardingArray(){
        onBoardingArray = [
            OnboardingModel(image: "1stOnboarding", description: "ساهم بفعل الخير بالتبرع من خلالنا", title: "كن خَـــيِّـــرْ "),
            OnboardingModel(image: "2ndOnboarding", description: "تقدر تتبرع من خلال الابلكيشن اونلاين لتوفير وقتك و مجهودك", title: "أتبرع أونلاين"),
            OnboardingModel(image: "3rdOnboarding", description: " أتبرع من مكانك و المندوب هياخد التبرع من باب بيتك", title: "تبرعك هيوصل اينما كنت")
        ]
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        moveToSignUpVC()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        moveToLoginVC()
    }
    
}
