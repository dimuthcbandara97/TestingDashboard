//
//  BaseController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit
import UserNotifications

enum NavBarPosition {
    case Left
    case Right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        constaintViews()
        configureAppearance()
    }
    
}

@objc extension BaseController {
    func setupViews() {
        // Placeholder implementation for setting up views
        // Add your code to set up your custom views in this function
    }
    
    func constaintViews() {
        // Placeholder implementation for setting up view constraints
        // Add your code to add constraints to your views in this function
    }
    
    func configureAppearance() {
        view.backgroundColor = .white
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar Left button tapped")
    }
    
    func navBarRightButtonHanler() {
        print("NavBar Right button tapped")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.red, for: .disabled)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .white
        
        switch position {
        case .Left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .Right:
            button.addTarget(self, action: #selector(navBarRightButtonHanler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
