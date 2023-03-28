//
//  PercentView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

extension TimerView {
    
    final class PercentView: BaseView {
         
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()

        // Percent
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .black
            label.textAlignment = .center
            return label
        }()

        // Subtitle
        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .gray
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            label.numberOfLines = 1
            return label
        }()


        
     // Setting Up
    override func setupViews() {
        super.setupViews()
        setupView(stackView)
        stackView.addArrangedSubview(percentLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
     
    // Constraint Views
    override func constaintViews() {
        
        super.constaintViews()
        
        // Layouts
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
        
        // Configuring
        func configure(with title: String, andValue value: Int) {
            subtitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
       
    }
}
