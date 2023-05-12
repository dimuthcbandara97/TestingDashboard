//
//  RegisterViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-21.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - UI Components
    
    // header View
    private let headerView = AuthHeaderView(title: "Register", subTitle: "Create your account")
    
    // name Fields
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let ageField = CustomTextField(fieldType: .age)
    private let genderField = CustomTextField(fieldType: .gender)
    //Remaining call

//    // MARK: - UserElement
//    struct UserElement: Codable {
//        let id, name, password, email: String
//        let gender, status: String
//        let imageurl: String
//        let v: Int
//
//        enum CodingKeys: String, CodingKey {
//            case id = "_id"
//            case name, password, email, gender, status, imageurl
//            case v = "__v"
//        }
//    }
//
//    typealias User = [UserElement]
   
    // Define the variables
//    var username: String? {
//        return usernameField.text
//    }
//
//    var email: String? {
//        return emailField.text
//    }
//
//    var password: String? {
//        return passwordField.text
//    }
//
//    var age: String? {
//        return ageField.text
//    }
//
//    var gender: String? {
//        return genderField.text
//    }

    // Create a user object with the defined variables
   
    
    // buttons
    private let signUpButton = CustomButton(title: "Register", hasBackground: true, fontSize: .big)
    private let signInButton = CustomButton(title: "Already have an account? Sign In.", fontSize: .med)
    
    // terms and conditions
    private let termsTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy.")
        
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        
        attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        
        let tv = UITextView()
        tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        tv.backgroundColor = .clear
        tv.attributedText = attributedString
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.delaysContentTouches = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        self.termsTextView.delegate = self
        
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        // Adding sub views
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(ageField)
        self.view.addSubview(genderField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)
        
        // Setting translatesAutoresizingMaskIntoConstraints
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.usernameField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.ageField.translatesAutoresizingMaskIntoConstraints = false
        self.genderField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.termsTextView.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false

        // Setting up constraints
        NSLayoutConstraint.activate([
            
            // header View
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 170),
            
            // User name
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // email
            self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // password
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            // age
                    self.ageField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
                    self.ageField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    self.ageField.heightAnchor.constraint(equalToConstant: 55),
                    self.ageField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                    
                    // gender
                    self.genderField.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 22),
                    self.genderField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    self.genderField.heightAnchor.constraint(equalToConstant: 55),
                    self.genderField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                    
                    // sign up
                    self.signUpButton.topAnchor.constraint(equalTo: genderField.bottomAnchor, constant: 22),
                    self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
                    self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            
            // terms and conditions
            self.termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 6),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // Sign In Button
            self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    // MARK: - Selectors
//    @objc func didTapSignUp() {
//        let userss = UserElement(name: username ?? "uname", password: password ?? "pwd", email: email ?? "email", gender: gender ?? "gender", status: "status", imageurl: "url")
//        APICaller.shared.insertUser(user:userss) { success, error in
//            if let error = error {
//                print("API call failed with error: \(error.localizedDescription)")
//                return
//            }
//            if success {
//                print("API call successful")
//            } else {
//                print("API call failed")
//            }
//        }
//    }
//    @objc func didTapSignUp() {
//        guard let username = usernameField.text,
//              let password = passwordField.text,
//              let email = emailField.text,
//              let gender = genderField.text else {
//            print("Required fields are missing")
//            return
//        }
//
//        let userr = UserElement(name: username, password: password, email: email, gender: gender, status: "Active", imageurl: "URL")
//
//        APICaller.shared.insertUser(user: userr, completionHandler: <#T##(Bool, Error?) -> Void#>){ success, error in
//            if let error = error{
//                print("API call failed with error: \(error.localizedDescription)")
//                return
//            }
//
//            if success {
//                print("API call successful")
//                // Handle successful API call
//            } else {
//                print("API call failed")
//                // Handle failed API call
//            }
//        }
//    }
//
    @objc func didTapSignUp() {
//        guard let username = usernameField.text,
//              let password = passwordField.text,
//              let email = emailField.text,
//              let gender = genderField.text else {
//            print("Required fields are missing")
//            return
//        }
//
//        let userr = UserElement(id:"",name: username, password: password, email: email, gender: gender, imageurl: "URL", v: 12)
//
//        APICaller.shared.insertUser(userr: userr) { success, error in
//            if let error = error {
//                print("API call failed with error: \(error.localizedDescription)")
//                return
//            }
//
//            if success {
//                print("API call successful")
//                // Handle successful API call
//            } else {
//                print("API call failed")
//                // Handle failed API call
//            }
//        }

        let username = usernameField.text!
        let email = emailField.text!
        let passowrd = passwordField.text!
        let age = ageField.text!
        let gender = genderField.text!
        
        
        print(username)
        print(email)
        print(passowrd)
        print(age)
        print(gender)
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Code to be executed after a 2 second delay
            
            let vc = RegisterDetailsController()
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }

  

    @objc private func didTapSignIn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension RegisterViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        // Google Terms and Conditions
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en")
        } else if URL.scheme == "privacy" {
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en")
        }
        
        return true
    }
    
    private func showWebViewerController(with urlString: String) {
        
        let vc = WebViewController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
