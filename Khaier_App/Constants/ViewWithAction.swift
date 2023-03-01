//
//  ViewWithAction.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/02/2023.
//

import UIKit

class ViewWithAction: UIControl {

    public var addAction: (() -> ())?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewAction()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewAction()
    }

    private func setupViewAction() {
        addTarget(self, action: #selector(viewTapped), for: .touchUpInside)
    }

    @objc private func viewTapped() {
        addAction?()
    }
    
}
