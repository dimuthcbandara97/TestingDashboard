//
//  LoginViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit
import SwiftKeychainWrapper

protocol UserSelectionDelegate {
    func didSelectProduct(email: String, password: String)
    func didActionTwo()
}

class LoginViewController: UIViewController {
    
    var delegate: UserSelectionDelegate?
    
    // MARK: - UI Components
    // Header View
    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account")
    
    // Email and password fields
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    // Buttons
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New User? Create Account.", fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password?", fontSize: .small)
    
    // MARK: - Validations
    var username: String? {
        return emailField.text
    }
    
    var password: String? {
        return passwordField.text
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Adding targets to buttons
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    // View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Adding subviews
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(newUserButton)
        view.addSubview(forgotPasswordButton)
        
        // Adding translatesAutoresizingMaskIntoConstraints
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - Constraints
        // Adding constraints
        NSLayoutConstraint.activate([
            // header View
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 222),
            
            // email Field
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // password Field
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // Sign In Button
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            // New User Button
            newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
            newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            newUserButton.heightAnchor.constraint(equalToConstant: 44),
            newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // Forget Password Button
            forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 6),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
    
    // MARK: - Sign In
    @objc private func didTapSignIn() {
        // Validate username and password
        guard let username = username, let password = password else {
            // Handle validation failure (e.g., show an error message)
            return
        }
        
        // MARK: Load Users
        APICaller.shared.loadUsers { [weak self] results in
            DispatchQueue.main.async {
                if results.count > 0 {
                    for user in results {
                        if user.email == username {
                            if (username == user.email && password == user.password) {
                                print("Email: \(user.email)")
                                print("Password: \(user.password)")
                                print("Gender: \(user.gender)")
                                print("ImageURL: \(user.imageurl)")
                                print("Name: \(user.name)")
                                
                                // Store user credentials in Keychain
                                let keychain = KeychainWrapper.standard
                                keychain.set(user.email, forKey: "UserEmail")
                                keychain.set(user.password, forKey: "UserPassword")
                                keychain.set(user.gender, forKey: "UserGender")
                                keychain.set(user.imageurl, forKey: "UserImageURL")
                                keychain.set(user.name, forKey: "UserName")
                                
                                let vc = TabBarController()
                                let nav = UINavigationController(rootViewController: vc)
                                nav.modalPresentationStyle = .fullScreen
                                self?.present(nav, animated: false, completion: nil)
                            }
                        }
                    }
                } else {
                    print("No results found")
                }
            }
        }
    }

    // MARK: - New User
    @objc private func didTapNewUser() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Forget Password
    @objc private func didTapForgotPassword() {
        let vc = ForgetPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
