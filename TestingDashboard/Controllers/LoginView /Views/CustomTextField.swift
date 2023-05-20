//
//  CustomTextField.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-21.
//

import Foundation

import UIKit

class CustomTextField: UITextField {
    
    
    // Defining username, email and password
    enum CustomTextFieldType {
        case username
        case email
        case password
        case age
        case gender
        case imageurl
        case status
        case height
        case weight
        case fitness_goal
    }
    
    // defininf auth Field Type
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
            
            // user name
        case .username:
            self.placeholder = "Username"
            
            // email
        case .email:
            self.placeholder = "Email Address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
            // password
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            
            // Age
        case .age:
            self.placeholder = "Age"
            
            // Gender
        case .gender:
            self.placeholder = "Gender"
            
        case .imageurl:
            self.placeholder = "Image Url"
        case .status:
            self.placeholder = "Job Role"
        case .height:
            self.placeholder = "Height"
        case .weight:
            self.placeholder = "Weight"
        case .fitness_goal:
            self.placeholder = "Fitness Goal"
        }
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
