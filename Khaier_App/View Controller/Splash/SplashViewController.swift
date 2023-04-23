//
//  SplashViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 13/02/2023.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var animateImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        animate()
    }
    
    private func moveToOnBoarding(){
        let vc = OnboardingViewController()
        push(vc: vc)
    }
    
    private func moveToTabBar(){
        let vc = TabBarController()
        push(vc: vc)
    }
    
    private func isOpenAppBefore() {
        if UserDefault.getLogin() || UserDefault.getRegister() {
            moveToLoginVC()
        } else {
            moveToOnBoarding()
        }
    }

    private func animate(){
        UIView.animate(withDuration: 1, delay: 0.5, options: []) {
            let scaleTransform = CGAffineTransform(scaleX: 0.23255, y: 0.23255)
            let translateTransform = CGAffineTransform(translationX: 173, y: -340.33)
            self.animateImage.transform = scaleTransform.concatenating(translateTransform)
        } completion: { [weak self] _ in
            if UserDefault.getReminder() {
                self?.moveToTabBar()
            } else {
                self?.isOpenAppBefore()
            }
        }
    }
    
}
