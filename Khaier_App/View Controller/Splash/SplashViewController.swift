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
        navigationController?.navigationBar.isHidden = true
        animate()
       
    }
    
    func moveToOnBoarding(){
        let vc = OnboardingViewController()
        navigationController?.pushViewController(vc, animated: false)
    }

    func animate(){
        UIView.animate(withDuration: 1, delay: 1, options: []) {
            let scaleTransform = CGAffineTransform(scaleX: 0.23255, y: 0.23255)
            let translateTransform = CGAffineTransform(translationX: 173, y: -340.33)
            self.animateImage.transform = scaleTransform.concatenating(translateTransform)
        } completion: { _ in
            self.moveToOnBoarding()
        }
    }
    
}
