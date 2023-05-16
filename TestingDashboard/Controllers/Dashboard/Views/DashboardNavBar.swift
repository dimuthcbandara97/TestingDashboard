//
//  DashboardNavBar.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit
import EventKit



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
        let eventStore = EKEventStore()

        eventStore.requestAccess(to: .event) { [weak self] granted, error in
            guard granted && error == nil else {
                // Access denied or error occurred
                let errorMessage = error?.localizedDescription ?? "Failed to request access to calendar."
                DispatchQueue.main.async {
                    self?.showAlert(title: "Access Denied", message: errorMessage)
                }
                return
            }

            // Access granted, proceed with adding the event
            let event = EKEvent(eventStore: eventStore)
            event.title = "Workout"
            event.startDate = Date() // Set the start date for the event
            event.endDate = Date().addingTimeInterval(3600) // Set the end date for the event (1 hour after start date)
            event.notes = "Don't forget to exercise!"

            // Set the calendar for the event
            let calendars = eventStore.calendars(for: .event)
            if let defaultCalendar = calendars.first {
                event.calendar = defaultCalendar
            } else {
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "No calendars found.")
                }
                return
            }

            do {
                try eventStore.save(event, span: .thisEvent)
                DispatchQueue.main.async {
                    self?.showAlert(title: "Success", message: "Event added to calendar!")
                }
            } catch {
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "Failed to save event to calendar: \(error.localizedDescription)")
                }
            }
        }
    }
//    @objc func showAllWorkouts(from viewController: UIViewController) {
//            let alertController = UIAlertController(title: "Add Workout Event", message: nil, preferredStyle: .alert)
//
//            alertController.addTextField { textField in
//                textField.placeholder = "Workout Title"
//            }
//
//            alertController.addTextField { textField in
//                textField.placeholder = "Event Notes"
//            }
//
//            let addAction = UIAlertAction(title: "Add", style: .default) { _ in
//                guard let titleTextField = alertController.textFields?.first,
//                      let notesTextField = alertController.textFields?.last,
//                      let title = titleTextField.text,
//                      let notes = notesTextField.text else {
//                    return
//                }
//
//                let eventStore = EKEventStore()
//
//                eventStore.requestAccess(to: .event) { granted, error in
//                    guard granted && error == nil else {
//                        // Access denied or error occurred
//                        let errorMessage = error?.localizedDescription ?? "Failed to request access to calendar."
//                        DispatchQueue.main.async {
//                            self.showAlert(from: viewController, title: "Access Denied", message: errorMessage)
//                        }
//                        return
//                    }
//
//                    // Access granted, proceed with adding the event
//                    let event = EKEvent(eventStore: eventStore)
//                    event.title = title
//                    event.startDate = Date() // Set the start date for the event
//                    event.endDate = Date().addingTimeInterval(3600) // Set the end date for the event (1 hour after start date)
//                    event.notes = notes
//
//                    // Set the calendar for the event
//                    let calendars = eventStore.calendars(for: .event)
//                    if let defaultCalendar = calendars.first {
//                        event.calendar = defaultCalendar
//                    } else {
//                        DispatchQueue.main.async {
//                            self.showAlert(from: viewController, title: "Error", message: "No calendars found.")
//                        }
//                        return
//                    }
//
//                    do {
//                        try eventStore.save(event, span: .thisEvent)
//                        DispatchQueue.main.async {
//                            self.showAlert(from: viewController, title: "Success", message: "Event added to calendar!")
//                        }
//                    } catch {
//                        DispatchQueue.main.async {
//                            self.showAlert(from: viewController, title: "Error", message: "Failed to save event to calendar: \(error.localizedDescription)")
//                        }
//                    }
//                }
//            }
//
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//            alertController.addAction(addAction)
//            alertController.addAction(cancelAction)
//
//            // Present the alert controller on the specified view controller
//            viewController.present(alertController, animated: true, completion: nil)
//        }
//
//        func showAlert(from viewController: UIViewController, title: String, message: String) {
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertController.addAction(okAction)
//            viewController.present(alertController, animated: true, completion: nil)
//        }



    func showAlert(title: String, message: String) {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        keyWindow.rootViewController?.present(alertController, animated: true, completion: nil)
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
            allWorkoutButton.widthAnchor.constraint(equalToConstant:             130),
            
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

