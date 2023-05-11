//
//  UICollectionViewCell+Extension.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 21/02/2023.
//

import UIKit

extension UICollectionViewCell{
    
    func colorOfLabelText(label: UILabel, description: String){
        let myString = description.prefix(111)
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: String(myString), attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "BlackColor")!]));
        text.append(NSAttributedString(string: "...المزيد", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppColor")!]))
        label.attributedText = text
    }
    
    func checkSaveButtonIsAccept(isRemember: inout Bool, button: UIButton){
        isRemember.toggle()
        isRemember ? button.setImage("save-fill") : button.setImage("save")
    }
    
    func checkSaveButtonIsAccept(id: Int, button: UIButton){
        id == 0 ? button.setImage("save") : button.setImage("save-fill")
    }

}

extension UICollectionView {
    
     func registerCell<Cell: UICollectionViewCell>(cellClass: Cell.Type){
        //MARK: Generic Register cells
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    func register<Cell:UICollectionViewCell>(cells:[Cell.Type]) {
        cells.forEach{(self.registerCell(cellClass: $0))}
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
    func registerHeaderFooter<Cell: UICollectionReusableView>(cellClass: Cell.Type, kind: String){
        //MARK: Generic Register Header (Header/Footer)
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: Cell.self))
    }
    
    //    UICollectionView.elementKindSectionHeader
    func dequeueHeaderFooter<Cell: UICollectionReusableView>(kind: String, indexPath:IndexPath) -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
}
