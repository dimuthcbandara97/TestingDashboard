//
//  BaseBarsView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

final class BaseBarsView: BaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    // MARK: Configure the bars
    func configureX(with data: [BaseBarView.Data]) {
        data.forEach {
            let barView = BaseBarView(data: $0)
            stackView.addArrangedSubview(barView)
        }
    }
}


// MARK: Extensions
extension BaseBarsView {
    
    override func setupViews() {
        super.setupViews()
        setupView(stackView)
    }
    
    // MARK: Constraints
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: Configure Appearance
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
