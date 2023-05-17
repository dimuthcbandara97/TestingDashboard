//
//  TabBarController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit
import SwiftKeychainWrapper



enum Tabs: Int, CaseIterable {
    case dashboard
    case session
    case progress
    case details
}

// MARK: - Tab Bar Controller
class TabBarController: UITabBarController {

    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
   
        configureAppearance()
        switchTo(tab: .dashboard)
    }
 
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAppearance()
    }
    
    //Selected TabBar item after loading
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    // MARK: - Configuring the Appearance
    private func configureAppearance() {

        // Ading Decorations to TabBar
        UITabBar.appearance().barTintColor = .white

        UITabBar.appearance().tintColor = .purple
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.purple]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        UITabBar.appearance().unselectedItemTintColor = .gray
//        UITabBar.appearance().selectedImageTintColor = .blue
        // Adding Animations
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        // Adding Controllers
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: tabController(for: tab))
            controller.tabBarItem = UITabBarItem(title: OverallController.Strings.TabBar.title(for: tab),
                                                 image: OverallController.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        
        view.layer.add(transition, forKey: kCATransition)
        setViewControllers(controllers, animated: true)

    }
    
    }

// MARK: - Tab Controller
    private func tabController(for tab: Tabs) -> BaseController {
        
        switch tab {
        case .dashboard: return DashboardBaseController()
        case .session: return SessionBaseController()
        case .progress: return ProgressBaseController()
        case .details: return SettingsBaseController()
        }
    }



