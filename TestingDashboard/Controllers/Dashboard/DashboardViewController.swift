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
    
     // MARK: Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let keychain = KeychainWrapper.standard

        if let userEmail = keychain.string(forKey: "UserEmail") {
            APICaller.shared.loadUserDetails { results in
                DispatchQueue.main.async {
                    if results.count > 0 {
                        for user in results {
                            if user.email == userEmail {
                                
                                    // Store user credentials in Keychain
                                keychain.set(user.fitnessGoal, forKey: "userDetailsFitnessGoal")
                                keychain.set(user.height, forKey: "userDetailsHeight")
                                keychain.set(user.weight, forKey: "userDetialsWeight")
                                keychain.set(user.age, forKey: "userDetialsAge")
                                keychain.set(user.status, forKey: "userDetialsStatus")
                                
                            } else {
                                print("User Emails Doesn't match")
                            }
                        }
                    } else {
                        print("No results found")
                    }
                }
            }
        }
       
        
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
            header.heightAnchor.constraint(equalToConstant: 350),
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
