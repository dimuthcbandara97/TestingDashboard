//
//  DashboardNavBar.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit

class DashboardNavBar: BaseView {
    
    let tableView = UITableView()
    let cellIdentifier = "CustomCell"
    // title label
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "Dashboard Navigation"
        label.textColor = .black
        // font should be added
        return label
    }()
    
    // Add Button
    private let addButton = UIButton()
    private let allWorkoutButton: BaseButton = {
        let button = BaseButton(with: .secondary)
        button.setTitle("My Workouts")
        button.backgroundColor = .systemPurple
        return button
    }()
    
    // WeekView
    private var weekView = WeekView()
    
    // layout subViews Here
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Addig for all subviews!
        addBottomBorder(with:.systemBlue, height: 1)
    }
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addButtonAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}


// Extension of DashboardNavBar

extension DashboardNavBar {
   
    override func setupViews() {
        super.setupViews()
        
        setupView(allWorkoutButton)
        setupView(titlelabel)
        setupView(addButton)
        setupView(weekView)
    }
   
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([

            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),

            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

            addButton.heightAnchor.constraint(equalToConstant: 28),

            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130),
            
            titlelabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titlelabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor),
            titlelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
            
        ])
    }
   
    override func configureAppearance() {
        super.configureAppearance()
     
        backgroundColor = .white

        
        allWorkoutButton.setTitle("Workouts")
        
        addButton.setImage(UIImage(systemName: "home"), for: .normal)
        
      
    }
}

