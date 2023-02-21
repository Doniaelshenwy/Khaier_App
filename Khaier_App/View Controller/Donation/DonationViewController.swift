//
//  DonationViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/02/2023.
//

import UIKit

class DonationViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let back = [NSAttributedString.Key.backgroundColor: UIColor.white]
          segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
          segmentedControl.setTitleTextAttributes(titleTextSelected, for: .selected)
        segmentedControl.backgroundColor = UIColor.white

    }

}
