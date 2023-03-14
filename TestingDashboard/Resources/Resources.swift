//
//  Resources.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-11.
//

import UIKit

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
        
    }
    enum Fonts {
        
    }
    enum Colors {
        
    }
}
