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
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        loginBtnOutlet.layer.borderColor = UIColor(named: "AppColor")?.cgColor
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDataOfonBoardingArray()
    }
    
    func setDataOfonBoardingArray(){
        onBoardingArray = [
            OnboardingModel(image: "1stOnboarding", description: "خير وسيط بين الجمعيات خير وسيط بين الجمعيات خير وسيط بين الجمعيات", title: "خير وسيط بين الجمعيات "),
            OnboardingModel(image: "2ndOnboarding", description: "خير وسيط بين الجمعيات خير وسيط بين الجمعيات خير وسيط بين الجمعيات", title: "خير وسيط بين الجمعيات"),
            OnboardingModel(image: "3rdOnboarding", description: "خير وسيط بين الجمعيات خير وسيط بين الجمعيات خير وسيط بين الجمعيات", title: "خير وسيط بين الجمعيات")
        ]
    }
    
    func moveToLoginVC(){
        let vc = LoginViewController(nibName: LoginViewController.identifier, bundle: nil)
        pushAnyViewController(vc: vc)
    }
    
    func moveToSignUpVC(){
        let vc = LoginViewController(nibName: SignUpViewController.identifier, bundle: nil)
        pushAnyViewController(vc: vc)
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        moveToSignUpVC()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        moveToLoginVC()
    }
    
}
