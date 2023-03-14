//
//  TabBarController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case dashboard
    case session
    case progress
    case settings
}

class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
   
        configureAppearance()
        switchTo(tab: .progress)
    }
 
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAppearance()
       
    }
    
    //Selected TabBar item after loading
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    
    private func configureAppearance() {

        // Adding Controllers
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: tabController(for: tab))
            return controller
        }
        
    setViewControllers(controllers, animated: false)
    }
    }
    private func tabController(for tab: Tabs) -> BaseController {
        
        switch tab {
        case .dashboard: return DashboardBaseController()
        case .session: return SessionBaseController()
        case .progress: return ProgressBaseController()
        case .settings: return SettingsBaseController()
        }
    }



