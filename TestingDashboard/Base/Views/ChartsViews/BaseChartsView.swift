//
//  BaseChartsView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

extension BaseChartsView {
    struct Data {
        let value: Int
        let title: String
    }
}

final class BaseChartsView: BaseView {

    private let xAxisView = XAxisView()

    
    func configureX(with data: [BaseChartsView.Data], topChartOffset: Int = 10) {
        xAxisView.configure(with: data)
        }
    }

extension BaseChartsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(xAxisView)

            
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([

            
            xAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}
