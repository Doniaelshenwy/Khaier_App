//
//  TabBarController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 14/02/2023.
//

import UIKit
//
//final class TabBarController: UITabBarController, UITabBarControllerDelegate {
//
//    let foodViewController = FoodViewController(nibName: FoodViewController.identefierVC, bundle: nil)
//    let mealViewController = MealViewController(nibName: MealViewController.identefierVC, bundle: nil)
//    let tableViewController = TableViewController(nibName: TableViewController.identefierVC , bundle: nil)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tabBar.tintColor = UIColor(named: "AppColor")
//        setTabBar()
//    }
//
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        SimpleAnnimationWhenSelectItem(item)
//    }
//
//    // MARK: Add navigation to all screens and set images in all tabs.
//    func setTabBar() {
//        let controllers = [
//            foodViewController,
//            mealViewController,
//            tableViewController
//                          ]
//
//        viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
//
//        setTabBarItem(for: 0, image: "house")
//        setTabBarItem(for: 1, image: "person")
//        setTabBarItem(for: 2, image: "person")
//    }
//
//    // MARK: Set tabBar image and selected image.
//    func setTabBarItem(for index: Int, image: String) {
//        tabBar.items?[index].image = UIImage(systemName: image)
////        tabBar.items?[index].selectedImage = UIImage(named: imag
//    }
//
//    // MARK: TabBar items animation when an item tapped
//    func SimpleAnnimationWhenSelectItem(_ item: UITabBarItem) {
//        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
//        let timeInterval: TimeInterval = 0.3
//        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
//            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
//        }
//        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
//        propertyAnimator.startAnimation()
//    }
//}
