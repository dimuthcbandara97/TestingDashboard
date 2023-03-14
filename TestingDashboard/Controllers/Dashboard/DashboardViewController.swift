//
//  DashboardViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

class DashboardBaseController: BaseController {
    
    // Navbar
    private let navBar = DashboardNavBar()
    
    // Header
    private let header = SectionHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension DashboardBaseController {
    
    override func setupViews(){
        super.setupViews()
        
        title = "Dashboard Main"
        view.setupView(navBar)
    }
    
    override func constaintViews() {
        super.constaintViews()
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            navBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            header.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)
//
            
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true
        
        //navBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
}
