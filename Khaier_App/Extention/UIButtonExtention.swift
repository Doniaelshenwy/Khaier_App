//
//  UIButtonExtention.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 06/02/2023.
//

import Foundation
import UIKit

extension UIButton{
    func setImage(_ name: String){
        setImage(UIImage(named: name), for: .normal)
    }
}
