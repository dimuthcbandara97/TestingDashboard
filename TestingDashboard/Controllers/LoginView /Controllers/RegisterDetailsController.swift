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

            
            // Sign In Button
            self.signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    // MARK: - Selectors

    @objc func didTapSignUp() {
//        let username = usernameField.text!
//        let email = emailField.text!
//        let password = passwordField.text!
//        let imageurl = imageurlField.text!
//        let gender = genderField.text!
        
//        self.view.addSubview(statusField)
//        self.view.addSubview(heightField)
//        self.view.addSubview(weightField)
//        self.view.addSubview(ageField)
//        self.view.addSubview(fitnessGoal)
        
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
        
        let userss = UserDetailssElement(status: status, height: height, weight: weight, age: age, fitnessGoal: fitnessGoal)
        
        APICaller.shared.insertUserDetails(userr:userss) { success, error in
                    if let error = error {
                        print("API call failed with error: \(error.localizedDescription)")
                        return
                    }
                    if success {
                        print("API call successful")
                    } else {
                        print("API call failed")
                    }
                }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Code to be executed after a 2 second delay
            
            let vc = RegisterDetailsController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        }


  
// MARK: didTapSignIn()
    @objc private func didTapSignIn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

// MARK: Register Details Controller
extension RegisterDetailsController: UITextViewDelegate {
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
