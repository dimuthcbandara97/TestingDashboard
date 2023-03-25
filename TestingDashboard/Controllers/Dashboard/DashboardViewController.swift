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

    
    let cellIdentifier = "CustomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }



}

extension DashboardBaseController {
    
    override func setupViews(){
        super.setupViews()
        
        title = "Dashboard Main"
        view.setupView(navBar)
        view.setupView(header)
//        view.addSubview(tableView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        NSLayoutConstraint.activate([
            
//            navBar.topAnchor.constraint(equalTo: view.topAnchor),
//            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
//            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor ),
//            navBar.bottomAnchor.constraint(equalTo: view.bottomAnchor) ,

            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                   navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   navBar.heightAnchor.constraint(equalToConstant: 300),
                   
                   // Constraints for header view
                   header.topAnchor.constraint(equalTo: navBar.bottomAnchor),
                   header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   header.heightAnchor.constraint(equalToConstant: 400)
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true

    }
    
}
