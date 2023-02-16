//
//  TabBarController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 14/02/2023.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {

    let profileViewController = ProfileViewController()
    let notificationViewController = NotificationViewController()
    let donationViewController = DonationViewController()
    let homeViewController = HomeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(named: "AppColor")
        
//        tabBar.layer.borderColor = UIColor(named: "borderTabBar")?.cgColor
//        tabBar.layer.backgroundColor = UIColor.white.cgColor
//        tabBar.layer.shadowColor = UIColor.red.cgColor
//        tabBar.layer.borderWidth = 1
//        tabBar.layer.cornerRadius = 20
//        tabBar.layer.shadowRadius = 40
        //tabBar.layer.shadowOpacity = 0.3
        //tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
      //  tabBar.layer.masksToBounds = true
        
    //  tabBar.layer.masksToBounds = true
//        tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
//        tabBar.layer.shadowOffset = CGSize(width: -4, height: -6)
//        tabBar.layer.shadowOpacity = 0.5
//        tabBar.layer.shadowRadius = 20
       
       
        tabBar.layer.masksToBounds = true
//        tabBar.layer.cornerRadius = tabBar.frame.height/2
//        tabBar.layer.shadowColor = UIColor.black.cgColor
//        tabBar.layer.shadowPath = UIBezierPath(roundedRect: tabBar.bounds, cornerRadius: tabBar.layer.cornerRadius).cgPath
//        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
//        tabBar.layer.shadowOpacity = 1
//        tabBar.layer.shadowRadius = 1.0
        
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
      


        
        setTabBar()
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        SimpleAnnimationWhenSelectItem(item)
    }

    // MARK: Add navigation to all screens and set images in all tabs.
    func setTabBar() {
        let controllers = [
            homeViewController,
            notificationViewController,
            donationViewController,
            profileViewController
                          ]

        viewControllers = controllers.map { UINavigationController(rootViewController: $0) }

        setTabBarItem(for: 3, image: "profile", selectImage: "profile-fill")
        setTabBarItem(for: 1, image: "notification", selectImage: "notification-fill")
        setTabBarItem(for: 2, image: "donate", selectImage: "donate-fill")
        setTabBarItem(for: 0, image: "home", selectImage: "home-fill")
        
        setTabBarTitle(for: 3, title: "حسابي")
        setTabBarTitle(for: 1, title: "اشعارات")
        setTabBarTitle(for: 2, title: "تبرعاتي")
        setTabBarTitle(for: 0, title: "الرئيسية")
    }

    // MARK: Set tabBar image and selected image.
    func setTabBarItem(for index: Int, image: String, selectImage: String) {
        tabBar.items?[index].image = UIImage(named: image)
        tabBar.items?[index].selectedImage = UIImage(named: selectImage)
    }
    
    // MARK: Set tabBar title
    func setTabBarTitle(for index: Int, title: String) {
        tabBar.items?[index].title = title
        
        guard let font: UIFont = UIFont(name: "IBMPlexSansArabic-Medium", size: 12) else { return }
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }

    // MARK: TabBar items animation when an item tapped
    func SimpleAnnimationWhenSelectItem(_ item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        let timeInterval: TimeInterval = 0.3
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
}
