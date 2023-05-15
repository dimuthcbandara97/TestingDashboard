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
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dashboard"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.shadowColor = .gray
        label.shadowOffset = CGSize(width: 1.0, height: 1.0)
        return label
    }()

    var navigationController: UINavigationController?
    
    // Add Button
    private let addButton = UIButton()
    private let allWorkoutButton: BaseButton = {
        let button = BaseButton(with: .secondary)
        button.backgroundColor = .systemPurple
        return button
    }()

    // WeekView
    private var weekView = WeekView()

    // layout subViews Here
    override func layoutSubviews() {
        super.layoutSubviews()
        // Adding for all subviews!
        addBottomBorder(with: .systemBlue, height: 1)
    }

    // MARK: Show All Workouts
    @objc func showAllWorkouts() {
        let allWorkoutsViewController = CustomSchedulePage()
        navigationController?.pushViewController(allWorkoutsViewController, animated: true)
    }

    // MARK: Setup Views
    override func setupViews() {
        super.setupViews()
        setupView(allWorkoutButton)
        setupView(titleLabel)
        setupView(addButton)
        setupView(weekView)
    }

    // MARK: Constraint Views
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

            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }

    // MARK: Configure Appearance
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white

        allWorkoutButton.setTitle("Workouts")

        addButton.setImage(UIImage(systemName: "home"), for: .normal)
        allWorkoutButton.addTarget(self, action: #selector(showAllWorkouts), for: .touchUpInside)
    }
}
