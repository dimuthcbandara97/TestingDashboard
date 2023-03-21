//
//  ForgetPasswordViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-21.
//

import Foundation
import UIKit

class ForgetPasswordViewController: UIViewController {

    // MARK: - UI Components
        
    // header View
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset your password")
        
        // email Field
        private let emailField = CustomTextField(fieldType: .email)
        
        // reset password button
        private let resetPasswordButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
        
        // MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Setting up the UI
            self.setupUI()
            
            // rest password button
            self.resetPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = false
        }
        
        // MARK: - UI Setup
        private func setupUI() {
            
            // setting up the background clour
            self.view.backgroundColor = .systemBackground
            
            // Adding sub Views
            self.view.addSubview(headerView)
            self.view.addSubview(emailField)
            self.view.addSubview(resetPasswordButton)
            
            // Configuring translatesAutoresizingMaskIntoConstraints
            headerView.translatesAutoresizingMaskIntoConstraints = false
            emailField.translatesAutoresizingMaskIntoConstraints = false
            resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
            
            // Setting up the constraints
            NSLayoutConstraint.activate([
                // Header View
                self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
                self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.headerView.heightAnchor.constraint(equalToConstant: 230),
                
                // email Field
                self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 11),
                self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.emailField.heightAnchor.constraint(equalToConstant: 55),
                self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                // reset password
                self.resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
                self.resetPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
                self.resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            ])
        }
        
        // MARK: - Selectors
        @objc private func didTapForgotPassword() {
            guard let email = self.emailField.text, !email.isEmpty else { return }
            
        }


}
