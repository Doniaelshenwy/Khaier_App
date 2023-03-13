//
//  DropDownList.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 12/02/2023.
//

import UIKit
import DropDown

class DropDownList{
    
    static let shared = DropDownList()
    private let dropDown = DropDown()
    
    var data: [String]?
    
    func setupDropDownList(view: UIView, label: UILabel){
        dropDown.anchorView = view
        dropDown.dataSource = data ?? []
        
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .any
        
        dropDown.customCellConfiguration = { (index, item, cell) in
            cell.optionLabel.textAlignment = .right
        }
        
        dropDown.selectionAction = { index, item in
            label.text = item
            view.layer.borderColor = UIColor(named: "AppColor")?.cgColor
        }
    }
    
    func showDropDownList(){
        dropDown.show()
    }
}
