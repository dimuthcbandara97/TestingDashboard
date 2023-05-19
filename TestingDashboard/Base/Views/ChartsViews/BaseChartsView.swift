//
//  BaseChartsView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

//import Foundation
//import UIKit
//
//extension BaseChartsView {
//    struct Data {
//        let value: Int
//        let title: String
//    }
//}
//
//// MARK: Base Charts View Extension
//final class BaseChartsView: BaseView {
//
//    private let xAxisView = XAxisView()
//
//
//    func configureX(with data: [BaseChartsView.Data], topChartOffset: Int = 10) {
//        xAxisView.configure(with: data)
//        }
//    }
//
//extension BaseChartsView {
//
//    // MARK: Setup Views
//    override func setupViews() {
//        super.setupViews()
//        setupView(xAxisView)
//    }
//
//    // MARK: Adding Constraints
//    override func constaintViews() {
//        super.constaintViews()
//        NSLayoutConstraint.activate([
//
//
//            xAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),
//
//        ])
//    }
//
//    override func configureAppearance() {
//        super.configureAppearance()
//        backgroundColor = .clear
//    }
//}
import Foundation
import UIKit

extension BaseChartsView {
    struct Data {
        let value: Int
        let title: String
    }
}

// MARK: Base Charts View Extension
final class BaseChartsView: BaseView {

    private let xAxisView = XAxisView()

    
    func configureX(with data: [BaseChartsView.Data], topChartOffset: Int = 10) {
        xAxisView.configure(with: data)
    }

    // MARK: Setup Views
    override func setupViews() {
        super.setupViews()
        setupView(xAxisView)
        
        // Add additional decorations
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        clipsToBounds = true
    }
    
    // MARK: Adding Constraints
    override func constaintViews() {
        super.constaintViews()
        NSLayoutConstraint.activate([
            xAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),
        ])
    }
    
    // MARK: Configure Appearance
    override func configureAppearance() {
        super.configureAppearance()
        
        // Customize appearance
        backgroundColor = .white
    }
}
