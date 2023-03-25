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
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [    .foregroundColor: UIColor.black]

        
        navigationBar.addBottomBorder(with: .blue, height: 1)
    }

}
