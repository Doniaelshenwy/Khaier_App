//
//  UIViewControllerExtension.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import UIKit

extension UIViewController {
    func goToHome() {
        tabBarController?.selectedIndex = 0
    }
}

// set border color for textfield and view and remove border
extension UIViewController{
    
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
    
    func removeBorderTextField(textFields: [UITextField]){
        textFields.forEach { $0.borderStyle = .none }
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

// move to another screen by push navigation controller
extension UIViewController{
    func push(vc: UIViewController){
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop(isTabBarHide: Bool){
        self.navigationController?.popViewController(animated: true)
        isTabBarHidden(isTabBarHide)
    }
    
    func customPresent(_ vc: UIViewController, animated: Bool) {
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: animated, completion: nil)
    }
    
    func moveToSignUpVC(){
        let vc = SignUpViewController()
        push(vc: vc)
    }
    
    func moveToLoginVC(){
        let vc = LoginViewController()
        push(vc: vc)
    }
    
    func moveToHomeVC(){
        let vc = TabBarController()
        push(vc: vc)
    }
    
}

// show or hide invalid label when text field is empty
extension UIViewController {
    
    func setZeroHeightLabel(for heights: [NSLayoutConstraint]) {
        heights.forEach { $0.constant = 0 }
    }

    func isHiddeninvalidLabel(for labels: [UILabel]){
        labels.forEach { $0.isHidden = true }
    }
    
    func hideLabel(heightInvalidLabel: NSLayoutConstraint, invalidLabel: UILabel){
        heightInvalidLabel.constant = 0
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
            invalidLabel.alpha = 0
        } completion: { _ in
            invalidLabel.isHidden = true
        }
    }
    
    func showLabel(heightConstrain: NSLayoutConstraint, repeatLabel: UILabel){
        repeatLabel.isHidden = false
        heightConstrain.constant = 20
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
            repeatLabel.alpha = 1
        }
    }
    
}

// change border color of text field and view according text field contain data or not
extension UIViewController {
    
    func checkColorBoderOfTextField(textfield: UITextField, label: UILabel, height: NSLayoutConstraint) {
        if textfield.text == "" {
            setGrayColorTF(textfield)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        } else {
            setAppColorTF(textfield)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        }
    }
    
    func checkColorBorderOfView(textfield: UITextField, view: UIView, label: UILabel, height: NSLayoutConstraint) {
        if textfield.text == "" {
            setGrayColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        } else {
            setAppColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        }
    }
    
    func checkTextFieldIsEmpty(textField: UITextField, height: NSLayoutConstraint, label invalid: UILabel ){
            setRedColorTF(textField)
            showLabel(heightConstrain: height, repeatLabel: invalid)
    }
    
    func checkViewIsEmpty(view: UIView, height: NSLayoutConstraint, label invalid: UILabel ){
    setRedColorView(view)
    showLabel(heightConstrain: height, repeatLabel: invalid)
    }
    
}

// address when use picker view
extension UIViewController {
    func checkAddressView(textField: UITextField, view: UIView, label: UILabel, height: NSLayoutConstraint) {
        if textField.text == "اختر المدينة و المنطقة" {
            setGrayColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        } else {
            setAppColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        }
    }
    
    func checkCityView(textField: UITextField, view: UIView, label: UILabel, height: NSLayoutConstraint) {
        if textField.text == "اختر المدينة" {
            setGrayColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        } else {
            setAppColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        }
    }
    
    func checkRegionView(textField: UITextField, view: UIView, label: UILabel, height: NSLayoutConstraint) {
        if textField.text == "اختر المنطقة" {
            setGrayColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        } else {
            setAppColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        }
    }
    
}

// call function if user check box of remember or accept condition or not
extension UIViewController{
    
    func checkBoxIsAccept(isRemember: inout Bool, button: UIButton){
        isRemember.toggle()
        isRemember ? button.setImage("fillCheck") : button.setImage("check")
    }
    
}

// call function if user check button, change background color and text
extension UIViewController{
    
    func changeColorOfSelectedButton(isSelectedButton: UIButton){
        isSelectedButton.backgroundColor = UIColor(named: "AppColor")
        isSelectedButton.tintColor = UIColor.white
    }
    
    func changeColorOfNotSelectedButton(notSelectedButton: UIButton){
            notSelectedButton.backgroundColor = UIColor.white
            notSelectedButton.tintColor = UIColor.black
    }
    
}

extension UIViewController {
    
    func isNavigationHidden(_ status: Bool) {
        navigationController?.setNavigationBarHidden(status, animated: true)
    }
    
    func isTabBarHidden(_ status: Bool){
        tabBarController?.tabBar.isHidden = status
    }
    
}

// add specific word and change color
extension UIViewController {
    
    func colorOfLabelText(label: UILabel, description: String){
        let myString = description.prefix(800)
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: String(myString), attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "BlackColor")!]));
        text.append(NSAttributedString(string: "...المزيد", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppColor")!]))
        label.attributedText = text
    }
    
}
