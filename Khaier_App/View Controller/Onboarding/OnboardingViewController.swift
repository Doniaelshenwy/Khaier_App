//
//  OnboardingViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import UIKit
import MBCircularProgressBar

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var previousBtnOutlet: UIButton!
    @IBOutlet weak var nextBtnOutlet: UIButton!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    var onBoardingArray: [OnboardingModel] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            checkCurrentPage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setDataOfonBoardingArray()
        previousBtnOutlet.isHidden = true
        self.progressView.value = 25
        nextBtnOutlet.borderColor = UIColor.white.cgColor
    }
    
    func setDataOfonBoardingArray(){
        onBoardingArray = [
            OnboardingModel(image: "1", description: "it is app and web site to help people and chairty", title: "Khair Application "),
            OnboardingModel(image: "2", description: "it is app and web site to help people and chairty", title: "Khair Application"),
            OnboardingModel(image: "1", description: "it is app and web site to help people and chairty", title: "Khair Application"),
            OnboardingModel(image: "2", description: "it is app and web site to help people and chairty", title: "Khair Application")
        ]
    }
    
    func checkToNext(){
        if currentPage == onBoardingArray.count - 1{
            moveToLoginVC()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            previousBtnOutlet.isHidden = false
            createNextProgressBar()
        }
    }
    
    func checkToPrevious(){
        if currentPage == 0{
            currentPage = 0
            previousBtnOutlet.isHidden = true
        } else {
            currentPage -= 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            previousBtnOutlet.isHidden = false
            checkCurrentPage()
            createPreviousProgressBar()
        }
    }
    
    func moveToLoginVC(){
        let vc = LoginViewController(nibName: LoginViewController.identifier, bundle: nil)
        pushAnyViewController(vc: vc)
    }
    
    func checkCurrentPage(){
        if currentPage == 0 {
            previousBtnOutlet.isHidden = true
        } else {
            previousBtnOutlet.isHidden = false
            createNextProgressBar()
        }
    }
    
    func createNextProgressBar(){
        UIView.animate(withDuration: 1.0) { [self] in
            self.progressView.value += 25
        }
    }
    
    func createPreviousProgressBar(){
        UIView.animate(withDuration: 1.0) { [self] in
            self.progressView.value -= 25
        }
    }
    
    
    @IBAction func skipBtn(_ sender: Any) {
        moveToLoginVC()
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        checkToNext()
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        checkToPrevious()
    }
}
