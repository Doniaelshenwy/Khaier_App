//
//  UIViewExtension.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

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

extension UIView {

    func addDashedBorder() {   // width view = 60 give 5 dash
        //Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 2
        // passing an array with the values [2,3] sets a dash pattern that alternates between a 2-user-space-unit-long painted segment and a 3-user-space-unit-long unpainted segment
        shapeLayer.lineDashPattern = [7,5]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
