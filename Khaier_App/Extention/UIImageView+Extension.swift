//
//  UIImageViewExtension.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import Foundation
import Kingfisher

extension UIImageView{
    func setImageKF(urlImage: String){
        guard let url = URL(string: urlImage) else{ return }
        self.kf.setImage(with: url)
    }
}


