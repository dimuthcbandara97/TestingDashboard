//
//  BaseBarsView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

final class BaseBarsView: BaseView {
    
    // Create a UIStackView to hold the bar views
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        
        // Add any additional stack view configuration here
        
        return view
    }()
    
    // Configure the bar views with the provided data
    func configureX(with data: [BaseBarView.Data]) {
        data.forEach {
            let barView = BaseBarView(data: $0)
            stackView.addArrangedSubview(barView)
        }
    }
}


// Extensions of BaseBars
extension BaseBarsView {
    
    // Set up the views
    override func setupViews() {
        super.setupViews()
        
        // Add the stack view to the view hierarchy
        setupView(stackView)
        
        // Add any additional view setup here
    }
    
    // Add constraints to the views
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            
            // Add constraints for the stack view here
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Add any additional constraints here
        ])
    }
    
    // Configure the appearance of the views
    override func configureAppearance() {
        super.configureAppearance()
        
        // Set the background color of the view
        backgroundColor = .clear
        
        // Add any additional appearance configuration here
    }
}
