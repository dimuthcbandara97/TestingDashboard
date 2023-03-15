//
//  BaseInfoView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import UIKit
import Foundation

class BaseInfoView: BaseView {
    private let titleLabel: UILabel = {
        let label = UILabel()
//        label.font
        label.textColor = .black
        return label
    }()
    
    
}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        
        setupView(titleLabel)

    }
}
