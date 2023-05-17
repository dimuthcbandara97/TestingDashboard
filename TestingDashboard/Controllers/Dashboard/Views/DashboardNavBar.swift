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
    

    private let titleButton: BaseButton = {
        let button = BaseButton(with: .primary)
        button.setTitle("View Scheudle", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.backgroundColor = .clear
        button.titleLabel?.shadowColor = .gray
        button.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 1.0)
        return button
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
                    if let viewController = self?.getVisibleViewController() {
                        self?.showAlert(title: "Access Denied", message: errorMessage, viewController: viewController)
                    }
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
                    if let viewController = self?.getVisibleViewController() {
                        self?.showAlert(title: "Error", message: "No calendars found.", viewController: viewController)
                    }
                }
                return
            }

            do {
                try eventStore.save(event, span: .thisEvent)
                DispatchQueue.main.async {
                    if let viewController = self?.getVisibleViewController() {
                        self?.showAlert(title: "Success", message: "Event added to calendar!", viewController: viewController)
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    if let viewController = self?.getVisibleViewController() {
                        self?.showAlert(title: "Error", message: "Failed to save event to calendar: \(error.localizedDescription)", viewController: viewController)
                    }
                }
            }
        }
    }

    func showAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alertController, animated: true, completion: nil)
    }

    func getVisibleViewController() -> UIViewController? {
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
            let rootViewController = keyWindow.rootViewController {
            var visibleViewController = rootViewController
            while let presentedViewController = visibleViewController.presentedViewController {
                visibleViewController = presentedViewController
            }
            return visibleViewController
        }
        return nil
    }


    @objc func showCalendar() {
        let alertController = UIAlertController(title: "Select a Date", message: nil, preferredStyle: .alert)
        
        // Configure alert title
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        let attributedTitle = NSAttributedString(string: "Select a Date", attributes: titleAttributes)
        alertController.setValue(attributedTitle, forKey: "attributedTitle")
        
        // Configure alert message
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        let messageAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray,
            .paragraphStyle: paragraphStyle
        ]
        let attributedMessage = NSAttributedString(string: "Please choose a date", attributes: messageAttributes)
        alertController.setValue(attributedMessage, forKey: "attributedMessage")
        
        // Create and add the date picker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        alertController.view.addSubview(datePicker)
        
        // Set date picker constraints
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 40),
            datePicker.leadingAnchor.constraint(equalTo: alertController.view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: alertController.view.trailingAnchor)
        ])
        
        // Configure cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor") // Change cancel action text color
        alertController.addAction(cancelAction)
        
        // Configure select action
        let selectAction = UIAlertAction(title: "Select", style: .default) { _ in
            let selectedDate = datePicker.date
            
            // Open the calendar app with the selected date
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: selectedDate)
            
            var dateComponents = DateComponents()
            dateComponents.year = components.year
            dateComponents.month = components.month
            dateComponents.day = components.day
            
            if let date = calendar.date(from: dateComponents) {
                let url = URL(string: "calshow:\(date.timeIntervalSinceReferenceDate)")!
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(selectAction)
        
        // Customize alert appearance
        alertController.view.tintColor = .systemPurple // Change the alert's tint color
        alertController.view.backgroundColor = .white // Change the alert's background color
        
        // Get the topmost presented view controller
        if let topViewController = UIApplication.shared.windows.first?.rootViewController?.topmostPresentedViewController() {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }

    // MARK: Setup Views
    override func setupViews() {
        super.setupViews()
        setupView(allWorkoutButton)
        setupView(titleButton)
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

            titleButton.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15), // Adjusted leading constraint
            titleButton.trailingAnchor.constraint(equalTo: allWorkoutButton.leadingAnchor, constant: -8), // Adjusted trailing constraint

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
        titleButton.addTarget(self, action: #selector(showCalendar), for: .touchUpInside)
        
        allWorkoutButton.addTarget(self, action: #selector(showAllWorkouts), for: .touchUpInside)
    }
}

extension UIViewController {
    func topmostPresentedViewController() -> UIViewController {
        if let presentedViewController = presentedViewController {
            return presentedViewController.topmostPresentedViewController()
        }
        
        if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController?.topmostPresentedViewController() ?? navigationController
        }
        
        if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.topmostPresentedViewController() ?? tabBarController
        }
        
        return self
    }
}






