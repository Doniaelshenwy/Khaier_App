//
//  UIViewControllerExtension.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import Foundation
import UIKit

extension UIViewController{
    func push(vc: UIViewController){
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setGrayColorTF(_ textField: UITextField){
        textField.layer.borderColor = UIColor(named: "disapleColor")?.cgColor
    }
    
    func setAppColorTF(_ textField: UITextField){
        textField.layer.borderColor = UIColor(named: "AppColor")?.cgColor
    }
    
    func setGrayColorView(_ view: UIView){
        view.layer.borderColor = UIColor(named: "disapleColor")?.cgColor
    }
    
    func setAppColorView(_ view: UIView){
        view.layer.borderColor = UIColor(named: "AppColor")?.cgColor
    }
    
    func setRedColorTF(_ textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    func setRedColorView(_ view: UIView){
        view.layer.borderColor = UIColor.red.cgColor
    }
    
    func hideLabel(heightConstrain: NSLayoutConstraint, v: UIView, repeatLabel: UILabel){
        heightConstrain.constant = 0
        UIView.animate(withDuration: 0.6) {
            v.layoutIfNeeded()
            repeatLabel.alpha = 0
        } completion: { _ in
            repeatLabel.isHidden = true
        }
    }
    
    func showLabel(heightConstrain: NSLayoutConstraint, v: UIView, repeatLabel: UILabel){
        repeatLabel.isHidden = false
        heightConstrain.constant = 20
        UIView.animate(withDuration: 0.6) {
            v.layoutIfNeeded()
            repeatLabel.alpha = 1
        }
    }
    
//    
//    func createNavigationController(title: String){
//        navigationItem.title = title
//        navigationController?.navigationBar.prefersLargeTitles = false
//        // color of back
//        navigationController?.navigationBar.tintColor = UIColor(named: "AppColor")
//        // when scroll change color
//       navigationController?.navigationBar.barTintColor = UIColor(named: "AppColor")
//        // change color of title
//        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "AppColor")]
//        navigationController?.navigationBar.titleTextAttributes = textAttributes
//        
//        let backButton = UIBarButtonItem()
//        backButton.title = ""
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        //navigationItem.hidesBackButton = true
//        navigationController?.navigationBar.backgroundColor = UIColor.green
//        let greenAppearance = UINavigationBarAppearance()
//                 greenAppearance.backgroundColor = UIColor(named: "AppColor")
//                 navigationController?.navigationBar.scrollEdgeAppearance = greenAppearance
//    }
}
