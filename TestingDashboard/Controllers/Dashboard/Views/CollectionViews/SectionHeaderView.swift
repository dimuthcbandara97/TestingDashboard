//
//  SectionHeaderView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit


class SectionHeaderView: BaseView {
    
    let tableView = UITableView()
    let cellIdentifier = "CustomCell"
    // title label
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "Your Exercises"
        label.textColor = .black
        // font should be added
        return label
    }()
    
    
    // layout subViews Here
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Addig for all subviews!
        addBottomBorder(with:.systemBlue, height: 1)
    }
    
   
}


// Extension of DashboardNavBar

extension SectionHeaderView {
   
    override func setupViews() {
        super.setupViews()
        
        setupView(titlelabel)

    }
   
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([

            
            titlelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            
        ])
    }
   
    override func configureAppearance() {
        super.configureAppearance()
     
        backgroundColor = .white

        
      
    }
}

