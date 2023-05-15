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
    view.backgroundColor = .white
    
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
//        button.tintColor = .systemPink
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        button.titleLabel?.highlightedFont = UIFont.systemFont(ofSize: 18, weight: .bold)

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
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
