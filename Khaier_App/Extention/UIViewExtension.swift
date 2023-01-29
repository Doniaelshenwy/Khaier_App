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
    
    @IBInspectable var borderColor : CGColor{
        get{
            return self.borderColor
        }
        set{
            self.layer.borderColor = newValue
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
}
