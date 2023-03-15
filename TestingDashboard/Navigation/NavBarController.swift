//
//  NavBarController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

class NavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure method
        
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
//        navigationBar.standardAppearance.titleTextAttributes = [
//            .foregroundColor: .systemGray
//        ]
        
        navigationBar.addBottomBorder(with: .blue, height: 1)
    }

}
