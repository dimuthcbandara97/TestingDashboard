//
//  DashboardViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit
import SwiftKeychainWrapper


class DashboardBaseController: BaseController {
    

    
    // Navbar
    private let navBar = DashboardNavBar()
    
    // Header
    private let header = SectionHeaderView()
    
    let cellIdentifier = "CustomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

    }
    
    override func setupViews() {
        super.setupViews()
        
        title = "Dashboard Main"
        view.setupView(navBar)
        view.setupView(header)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 300),
            navBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            navBar.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

        // Constraints for header view
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 375),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        // Show or hide the navigation bar as desired
        navigationController?.navigationBar.isHidden = false
    }
}
