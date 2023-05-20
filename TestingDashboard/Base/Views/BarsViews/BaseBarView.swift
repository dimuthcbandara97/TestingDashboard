//
//  BaseBarView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

extension BaseBarView {
    struct Data {
        let value: String
        let heightMultiplier: Double
        let title: String
    }
}

final  class BaseBarView: BaseView {
    
    private let heightMultiplier: Double
    
    // MARK: - Setting Up
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .purple
        label.textAlignment = .center
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 2.5
        view.layer.masksToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    init(data: Data) {
        self.heightMultiplier = data.heightMultiplier
        super.init(frame: .zero)
        
        valueLabel.text = data.value
        titleLabel.text = data.title.uppercased()
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }
    
}

extension BaseBarView {
    
    // MARK: Setup Views
    override func setupViews() {
        super.setupViews()
        
        setupView(valueLabel)
        setupView(barView)
        setupView(titleLabel)
    }
    
    // MARK: Constraint Views
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            // Value label
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            // Bar View
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 7),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier * 0.8),
            
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
//    // MARK: Configure Appearance

//    override func configureAppearance() {
//        super.configureAppearance()
//
//        backgroundColor = UIColor(white: 0.9, alpha: 1.0) // Set a light gray background color
//
//        barView.backgroundColor = .systemTeal
//        barView.layer.cornerRadius = barView.bounds.height / 2 // Make the barView rounded
//
//        // Apply a shadow to the barView
//        barView.layer.shadowColor = UIColor.black.cgColor
//        barView.layer.shadowOpacity = 0.5
//        barView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        barView.layer.shadowRadius = 4
//
//        // Add a border to the barView
//        barView.layer.borderWidth = 1
//        barView.layer.borderColor = UIColor.white.cgColor
//
//
//    }

    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = UIColor(white: 0.9, alpha: 1.0) // Set a light gray background color
        
        barView.backgroundColor = .systemTeal
        barView.layer.cornerRadius = barView.bounds.height / 2 // Make the barView rounded
        
        // Apply a shadow to the barView
        barView.layer.shadowColor = UIColor.black.cgColor
        barView.layer.shadowOpacity = 0.5
        barView.layer.shadowOffset = CGSize(width: 0, height: 2)
        barView.layer.shadowRadius = 4
        
        // Add a border to the barView
        barView.layer.borderWidth = 1
        barView.layer.borderColor = UIColor.white.cgColor
        
        // Animate the appearance
        UIView.animate(withDuration: 2) {
            self.barView.alpha = 1.0
        }
    }

}
