//
//  Resources.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-11.
//

import UIKit

// Overall controller is addeed to add constant Strings and numbers
enum OverallController {
    
    // Create seperate enums for Strings, Images, Fonts, and Colors
    enum Strings {
        // For TabBar Controller
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .dashboard: return "Home"
                case .session: return "Session"
                case .progress: return "Progress"
                case .details: return "Details"
                }
            }
        }
        // For NavBar Controller
        enum NavBar {
            static let dashboard = "Hello"
            static let session = "Load Your Exercise"
            static let progress = "Your Progress"
            static let nutrition = "Exercise Details"
        }
        // For Login Contrller
        enum Login2{
            // user name
            static let usernameLabel = "User Name"
            static let usernamePlaceholder = "Enter your username"
            // password
            static let password = "Enter Your Password"
            // Button
            static let button = "Login Here"
        }
        enum SignUp2{
            // First Name
            static let firstNameLabel = "First Name"
            // Last Name
            static let lastNameLabel = "Last Name"
            // Password
            static let passwordLabel = "Password"
            // Confirm password
            static let confirmPasswordLabel = "Confirm Password"
            // Button
            static let signup = "Sign Up"
        }
        
        enum BMI {
            static let age = "Your Age"
            static let gender = "Your Gender"
            static let weight = "Wegihts in Killograms"
            static let height = "Height in meters"
            
            // For the output
            static let underweight = "You are underweight !"
            static let normalweight = "You are in range. Keep it up"
            static let overweight = "You are overweight"
            static let obese = "You are obese! you are in daanger Zone"
        }
    }
    enum Images {
        // For TabBar Contorller
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .dashboard: return UIImage(systemName: "house")
                case .session: return UIImage(systemName: "bolt")
                case .progress: return UIImage(systemName: "chart.bar.xaxis")
                case .details: return UIImage(systemName: "info.circle")
                    
                }
            }
        }
        // For NavBar Controller
        // For Login Controller
        // For Dashboard Controller
    }
    enum Fonts {
        // Tab Bar
        // Nav bar
        // Login
        // Sign Up
        // Others
    }
    enum Colors {
        // Tab Bar
        // Nav bar
        // Login
        // Sign Up
        // Others
    }
}
