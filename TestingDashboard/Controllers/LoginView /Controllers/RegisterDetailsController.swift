//
//  RegisterDetailsController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-05-08.
//


import Foundation
import UIKit

class RegisterDetailsController: UIViewController {
    
    // MARK: - UI Components
    
    // header View
    private let headerView = AuthHeaderView(title: "Enter Your Details", subTitle: "Create your account")
    
    // name Fields
    private let statusField = CustomTextField(fieldType: .status)
    private let heightField = CustomTextField(fieldType: .height)
    private let weightField = CustomTextField(fieldType: .weight)
    private let ageField = CustomTextField(fieldType: .age)
    private let fitnessGoal = CustomTextField(fieldType: .fitness_goal)
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
    private let signUpButton = CustomButton(title: "Continue", hasBackground: true, fontSize: .big)
    private let signInButton = CustomButton(title: "Already have an account? Sign In.", fontSize: .med)
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
//        self.termsTextView.delegate = self
        
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
        self.view.addSubview(statusField)
        self.view.addSubview(heightField)
        self.view.addSubview(weightField)
        self.view.addSubview(ageField)
        self.view.addSubview(fitnessGoal)
        self.view.addSubview(signUpButton)
//        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)
        
        // Setting translatesAutoresizingMaskIntoConstraints
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.statusField.translatesAutoresizingMaskIntoConstraints = false
        self.heightField.translatesAutoresizingMaskIntoConstraints = false
        self.weightField.translatesAutoresizingMaskIntoConstraints = false
        self.ageField.translatesAutoresizingMaskIntoConstraints = false
        self.fitnessGoal.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
//        self.termsTextView.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false

        // Setting up constraints
        NSLayoutConstraint.activate([
            
            // header View
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 170),
            
            // User name
            self.statusField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.statusField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.statusField.heightAnchor.constraint(equalToConstant: 55),
            self.statusField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // email
            self.heightField.topAnchor.constraint(equalTo: statusField.bottomAnchor, constant: 22),
            self.heightField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.heightField.heightAnchor.constraint(equalToConstant: 55),
            self.heightField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // password
            self.weightField.topAnchor.constraint(equalTo: heightField.bottomAnchor, constant: 22),
            self.weightField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.weightField.heightAnchor.constraint(equalToConstant: 55),
            self.weightField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            // age
                    self.ageField.topAnchor.constraint(equalTo: weightField.bottomAnchor, constant: 22),
                    self.ageField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    self.ageField.heightAnchor.constraint(equalToConstant: 55),
                    self.ageField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                    
                    // gender
                    self.fitnessGoal.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 22),
                    self.fitnessGoal.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    self.fitnessGoal.heightAnchor.constraint(equalToConstant: 55),
                    self.fitnessGoal.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                    
                    // sign up
                    self.signUpButton.topAnchor.constraint(equalTo: fitnessGoal.bottomAnchor, constant: 22),
                    self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
                    self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            
            // terms and conditions
//            self.termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 6),
//            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
//            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            // Sign In Button
            self.signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 11),
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
        guard let status = statusField.text,
              let weightStr = weightField.text,
              let heightStr = heightField.text,
              let ageStr = ageField.text,
              let fitnessGoal = fitnessGoal.text,
              let weight = Int(weightStr),
              let height = Int(heightStr),
              let age = Int(ageStr) else {
            print("Required fields are missing or invalid")
            return
        }
        
        let userr = UserDetailssElement(id: "", status: status,height: height, weight: weight, age:age, fitnessGoal: fitnessGoal, v: 98)
        
        
    }

  

    @objc private func didTapSignIn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension RegisterDetailsController: UITextViewDelegate {
    
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
