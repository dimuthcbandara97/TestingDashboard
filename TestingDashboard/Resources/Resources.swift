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
                case .settings: return "Settings"
                }
            }
        }
        // For NavBar Controller
        enum NavBar {
            static let dashboard = "Hello"
            static let session = "Load Your Exercise"
            static let progress = "Your Progress"
            static let settings = "Settings"
        }
    }
    enum Images {
        // For TabBar Contorller
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .dashboard: return UIImage(systemName: "house")
                case .session: return UIImage(systemName: "timer")
                case .progress: return UIImage(systemName: "chart.bar")
                case .settings: return UIImage(systemName: "gear")
                }
            }
        }
    }
    enum Fonts {
        
    }
    enum Colors {
        
    }
}
