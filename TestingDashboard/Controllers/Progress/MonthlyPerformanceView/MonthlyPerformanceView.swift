//
//  MonthlyPerformanceView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

final class MonthlyPerformanceView: BaseInfoView {
    
    private let barsView = BaseBarsView()
    
    func configure(with items: [BaseBarView.Data]) {
        barsView.configureX(with: items)
    }
}

extension MonthlyPerformanceView {
    
    // MARK: Setup Views
    override func setupViews() {
        super.setupViews()
        setupView(barsView)
    }
    
    // MARK: Constraints
    override func constaintViews(){
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    // MARK: Configure Appearance
    override func configureAppearance(){
        super.configureAppearance()
    }
}

//test commit
