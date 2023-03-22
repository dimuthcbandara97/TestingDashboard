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
    case nutrition
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

        // Ading Decorations to TabBar
        
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
    private func tabController(for tab: Tabs) -> BaseController {
        
        switch tab {
        case .dashboard: return DashboardBaseController()
        case .session: return SessionBaseController()
        case .progress: return ProgressBaseController()
        case .nutrition: return SettingsBaseController()
        }
    }



