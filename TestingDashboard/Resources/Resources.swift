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
                case .dashboard: return "Exercise Dashboard"
                case .session: return "Your Session"
                case .progress: return "Your Progress"
                case .nutrition: return "Health"
                }
            }
        }
        // For NavBar Controller
        enum NavBar {
            static let dashboard = "Hello"
            static let session = "Load Your Exercise"
            static let progress = "Your Progress"
            static let nutrition = "Health"
        }
        // For Login Contrller
        enum Login2{
            // user name
            static let usernameLabel = "User Name"
            static let usernamePlaceholder = "Enter your placeholder"
            // password
            // Button
        }
        enum SignUp2{
            // First Name
            // Last Name
            // Password
            // Confirm password
            // Button
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
                    case .nutrition: return UIImage(systemName: "leaf")
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
