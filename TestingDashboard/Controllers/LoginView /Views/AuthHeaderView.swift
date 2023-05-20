//
//  AuthHeaderView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-21.
//

import Foundation
import UIKit

class AuthHeaderView: UIView {
    
    // Logo Image View Component
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "figure.walk")
        return iv
    }()
    
    // Title Label Component
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    // Sub Title Label Component
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    // init method called
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // UI Setup starts here
    private func setupUI() {
        
        // Adding subviews
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        // seting translatesAutoresizingMaskIntoConstraints
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // setting layout constraints manually
        NSLayoutConstraint.activate([
            
            // layout constraints for logo image view
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 90),
            self.logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            // layout constariants for title
            self.titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 19),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // layout constraints for subtitle
            self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
