//
//  UIViewExtension.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var CornerRedius : CGFloat{
        get{
            return self.CornerRedius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth : CGFloat{
        get{
            return self.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
            get {
                if let color = layer.borderColor {
                    return UIColor(cgColor: color)
                }
                return nil
            }
            set {
                if let color = newValue {
                    layer.borderColor = color.cgColor
                } else {
                    layer.borderColor = nil
                }
            }
        }
    
    @IBInspectable var shadowOffest : CGSize{
        get{
            return self.shadowOffest
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRedius : CGFloat{
        get{
            return self.shadowRedius
        }
        set{
            self.layer.shadowRadius = newValue
        }
    }
    
    func applyRTL(){
        self.semanticContentAttribute = .forceRightToLeft
    }
}
