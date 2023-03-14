//
//  BaseController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit


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
   
    
    func setupViews(){}
    func constaintViews(){}
    func configureAppearance(){
        view.backgroundColor = .systemGray
    
    }
    
    
    
    func navBarLeftButtonHandler(){ print("NavBar Lefight button tapped") }
    
    func navBarRightButtonHanler(){ print("NavBar Right button tapped") }
}



extension BaseController {

    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.red, for: .disabled)
//        button.titleLabel
//
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
