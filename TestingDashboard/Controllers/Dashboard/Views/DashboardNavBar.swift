//
//  DashboardNavBar.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit

//class DashboardNavBar: BaseView {
//
//    let tableView = UITableView()
//    let cellIdentifier = "CustomCell"
//    // title label
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Dashboard"
//        label.textColor = .black
//        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
////        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.5
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        label.backgroundColor = .clear
//        label.shadowColor = .gray
//        label.shadowOffset = CGSize(width: 1.0, height: 1.0)
////        label.shadowOpacity = 0.5
//        return label
//    }()
//
//    var navigationController: UINavigationController?
//    // Add Button
//    private let addButton = UIButton()
//    private let allWorkoutButton: BaseButton = {
//        let button = BaseButton(with: .secondary)
////        button.setTitle("My Workouts")
//        button.backgroundColor = .systemPurple
////        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
////        button.addTarget(DashboardNavBar.self, action: #selector(showAllWorkouts), for: .touchUpInside) // add action to button
//        return button
//    }()
//
//
//    // WeekView
//    private var weekView = WeekView()
//
//    // layout subViews Here
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        //Addig for all subviews!
//        addBottomBorder(with:.systemBlue, height: 1)
//    }
//
//
//    @objc func showAllWorkouts() {
//        let allWorkoutsViewController = CustomSchedulePage()
//        navigationController?.pushViewController(allWorkoutsViewController, animated: true)
//    }
////    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
////        allWorkoutButton.addTarget(target, action: action, for: .touchUpInside)
////    }
////
////    func addButtonAction(_ action: Selector, with target: Any?) {
////        addButton.addTarget(target, action: action, for: .touchUpInside)
////    }
////    @objc func showAlert() {
////        let alertController = UIAlertController(title: "Workout Selection", message: nil, preferredStyle: .alert)
////
////        let runningAction = UIAlertAction(title: "Running", style: .default, handler: nil)
////        let liftingAction = UIAlertAction(title: "Lifting", style: .default, handler: nil)
////        let swimmingAction = UIAlertAction(title: "Swimming", style: .default, handler: nil)
////
////        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
////
////        alertController.addAction(runningAction)
////        alertController.addAction(liftingAction)
////        alertController.addAction(swimmingAction)
////        alertController.addAction(cancelAction)
////
////        // present the alert controller from the current view controller
////        if let currentViewController = UIApplication.shared.windows.first?.rootViewController {
////            currentViewController.present(alertController, animated: true, completion: nil)
////        }
////    }
//
//}
//
//
//// Extension of DashboardNavBar
//
//extension DashboardNavBar {
//
//    override func setupViews() {
//        super.setupViews()
//
//        setupView(allWorkoutButton)
//        setupView(titleLabel)
//        setupView(addButton)
//        setupView(weekView)
//
//    }
//
//    override func constaintViews() {
//        super.constaintViews()
//
//        NSLayoutConstraint.activate([
//
//            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
//
//            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
//
//            addButton.heightAnchor.constraint(equalToConstant: 28),
//
//            addButton.widthAnchor.constraint(equalToConstant: 28),
//
//            allWorkoutButton.topAnchor.constraint(equalTo: addButton.topAnchor),
//            allWorkoutButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
//            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
//            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130),
////            allWorkoutButton.addTarget(self, action: #selector(showAllWorkoutsAction), for: .touchUpInside)
//
//
//
//
//            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
//
//            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
//            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
//            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
//            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
//            weekView.heightAnchor.constraint(equalToConstant: 47)
//
//        ])
//
//    }
//
//    override func configureAppearance() {
//        super.configureAppearance()
//
//        backgroundColor = .white
//
//
//
//        allWorkoutButton.setTitle("Workouts")
//
//
//
//        addButton.setImage(UIImage(systemName: "home"), for: .normal)
////        addButton.addTarget(self, action: #selector(showAllWorkouts), for: .touchUpInside);
//
//        allWorkoutButton.addTarget(self, action: #selector(showAllWorkouts), for: .touchUpInside);
//
//
//
//
//    }
//
//}
//

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

    @objc func showAllWorkouts() {
        let allWorkoutsViewController = CustomSchedulePage()
        navigationController?.pushViewController(allWorkoutsViewController, animated: true)
    }

    override func setupViews() {
        super.setupViews()
        setupView(allWorkoutButton)
        setupView(titleLabel)
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

    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white

        allWorkoutButton.setTitle("Workouts")

        addButton.setImage(UIImage(systemName: "home"), for: .normal)
        allWorkoutButton.addTarget(self, action: #selector(showAllWorkouts), for: .touchUpInside)
    }
}
