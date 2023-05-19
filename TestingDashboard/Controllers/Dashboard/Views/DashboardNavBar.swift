//
//  DashboardNavBar.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit
import EventKit
import UserNotifications


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
    
    //    @objc func showAllWorkouts() {
    //        let eventStore = EKEventStore()
    //
    //        eventStore.requestAccess(to: .event) { [weak self] eventAccessGranted, eventError in
    //            guard eventAccessGranted && eventError == nil else {
    //                // Access to events denied or error occurred
    //                let eventErrorMessage = eventError?.localizedDescription ?? "Failed to request access to the calendar."
    //                DispatchQueue.main.async {
    //                    if let viewController = self?.getVisibleViewController() {
    //                        self?.showAlert(title: "Access Denied", message: eventErrorMessage, viewController: viewController)
    //                    }
    //                }
    //                return
    //            }
    //
    //            eventStore.requestAccess(to: .reminder) { [weak self] reminderAccessGranted, reminderError in
    //                guard reminderAccessGranted && reminderError == nil else {
    //                    // Access to reminders denied or error occurred
    //                    let reminderErrorMessage = reminderError?.localizedDescription ?? "Failed to request access to reminders."
    //                    DispatchQueue.main.async {
    //                        if let viewController = self?.getVisibleViewController() {
    //                            self?.showAlert(title: "Access Denied", message: reminderErrorMessage, viewController: viewController)
    //                        }
    //                    }
    //                    return
    //                }
    //
    //                // Access granted, proceed with adding the event and reminder
    //                let event = EKEvent(eventStore: eventStore)
    //                event.title = "Workout"
    //                event.notes = "Don't forget to exercise!"
    //
    //                DispatchQueue.main.async {
    //                    // Prompt the user to select a date and time
    //                    let alertController = UIAlertController(title: "Choose Date and Time", message: nil, preferredStyle: .alert)
    //
    //                    // Create and configure the date picker
    //                    let datePicker = UIDatePicker()
    //                    datePicker.datePickerMode = .dateAndTime
    //
    //                    // Add the date picker to the alert controller
    //                    alertController.view.addSubview(datePicker)
    //
    //                    // Add OK action
    //                    let addAction = UIAlertAction(title: "OK", style: .default) { _ in
    //                        DispatchQueue.main.async {
    //                            event.startDate = datePicker.date
    //                            event.endDate = datePicker.date.addingTimeInterval(600)
    //
    //                            // Set the calendar for the event
    //                            let calendars = eventStore.calendars(for: .event)
    //                            if let defaultCalendar = calendars.first {
    //                                event.calendar = defaultCalendar
    //                            } else {
    //                                if let viewController = self?.getVisibleViewController() {
    //                                    self?.showAlert(title: "Error", message: "No calendars found.", viewController: viewController)
    //                                }
    //                                return
    //                            }
    //
    //                            do {
    //                                try eventStore.save(event, span: .thisEvent)
    //                                if let viewController = self?.getVisibleViewController() {
    //                                    //                                    self?.showAlert(title: "Success", message: "Event added to calendar!", viewController: viewController)
    //                                }
    //
    //                                // Add a reminder for the event
    //                                let reminder = EKReminder(eventStore: eventStore)
    //                                reminder.title = "Workout Reminder"
    //                                reminder.calendar = eventStore.defaultCalendarForNewReminders()
    //
    //                                let alarm = EKAlarm(absoluteDate: event.startDate)
    //                                reminder.addAlarm(alarm)
    //
    //                                do {
    //                                    try eventStore.save(reminder, commit: true)
    //                                    if let viewController = self?.getVisibleViewController() {
    //                                        self?.showAlert(title: "Success", message: "Event and reminder added to calendar!", viewController: viewController)
    //                                    }
    //                                } catch {
    //                                    if let viewController = self?.getVisibleViewController() {
    //                                        self?.showAlert(title: "Error", message: "Failed to save reminder to calendar: \(error.localizedDescription)", viewController: viewController)
    //                                    }
    //                                }
    //                            } catch {
    //                                if let viewController = self?.getVisibleViewController() {
    //                                    self?.showAlert(title: "Error", message:
    //                                                        "Failed to save event to calendar: \(error.localizedDescription)", viewController: viewController)
    //                                }
    //                            }
    //                        }
    //                    }
    //                    alertController.addAction(addAction)
    //
    //                    // Add cancel action
    //                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    //                    alertController.addAction(cancelAction)
    //
    //                    // Customize alert controller appearance
    //                    alertController.view.tintColor = .systemGreen
    //                    alertController.view.backgroundColor = .white
    //                    alertController.view.layer.cornerRadius = 10
    //
    //                    // Customize date picker appearance
    //                    datePicker.setValue(UIColor.systemGreen, forKey: "textColor")
    //
    //                    // Add padding to the top constraint of the alert controller's view
    //                    let paddingTop: CGFloat = 16
    //                    if let alertControllerView = alertController.view.subviews.first?.subviews.first {
    //                        alertControllerView.topAnchor.constraint(equalTo: alertControllerView.superview!.topAnchor, constant: paddingTop).isActive = true
    //                    }
    //
    //                    if let viewController = self?.getVisibleViewController() {
    //                        viewController.present(alertController, animated: true, completion: nil)
    //                    }
    //                }
    //            }
    //        }
    //    }
    //
    @objc func showAllWorkouts() {
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event) { [weak self] eventAccessGranted, eventError in
            guard eventAccessGranted && eventError == nil else {
                // Access to events denied or error occurred
                let eventErrorMessage = eventError?.localizedDescription ?? "Failed to request access to the calendar."
                DispatchQueue.main.async {
                    if let viewController = self?.getVisibleViewController() {
                        self?.showAlert(title: "Access Denied", message: eventErrorMessage, viewController: viewController)
                    }
                }
                return
            }
            
            eventStore.requestAccess(to: .reminder) { [weak self] reminderAccessGranted, reminderError in
                guard reminderAccessGranted && reminderError == nil else {
                    // Access to reminders denied or error occurred
                    let reminderErrorMessage = reminderError?.localizedDescription ?? "Failed to request access to reminders."
                    DispatchQueue.main.async {
                        if let viewController = self?.getVisibleViewController() {
                            self?.showAlert(title: "Access Denied", message: reminderErrorMessage, viewController: viewController)
                        }
                    }
                    return
                }
                
                // Access granted, proceed with adding the event and reminder
                let event = EKEvent(eventStore: eventStore)
                event.title = "Workout"
                event.notes = "Don't forget to exercise!"
                
                DispatchQueue.main.async {
                    // Prompt the user to select a date and time
                    let alertController = UIAlertController(title: "Choose Date and Time", message: nil, preferredStyle: .alert)
                    
                    // Create and configure the date picker
                    let datePicker = UIDatePicker()
                    datePicker.datePickerMode = .dateAndTime
                    
                    // Add the date picker to the alert controller
                    alertController.view.addSubview(datePicker)
                    
                    // Add OK action
                    let addAction = UIAlertAction(title: "OK", style: .default) { _ in
                        DispatchQueue.main.async {
                            event.startDate = datePicker.date
                            event.endDate = datePicker.date.addingTimeInterval(600)
                            
                            // Set the calendar for the event
                            let calendars = eventStore.calendars(for: .event)
                            if let defaultCalendar = calendars.first {
                                event.calendar = defaultCalendar
                            } else {
                                if let viewController = self?.getVisibleViewController() {
                                    self?.showAlert(title: "Error", message: "No calendars found.", viewController: viewController)
                                }
                                return
                            }
                            
                            do {
                                try eventStore.save(event, span: .thisEvent)
                                if let viewController = self?.getVisibleViewController() {
//                                    self?.showAlert(title: "Success", message: "Event added to calendar!", viewController: viewController)
                                }
                                
                                // Add a reminder for the event
                                let reminder = EKReminder(eventStore: eventStore)
                                reminder.title = "Workout Reminder"
                                reminder.calendar = eventStore.defaultCalendarForNewReminders()
                                
                                let alarm = EKAlarm(absoluteDate: event.startDate)
                                reminder.addAlarm(alarm)
                                
                                do {
                                    try eventStore.save(reminder, commit: true)
                                    if let viewController = self?.getVisibleViewController() {
                                        self?.showAlert(title: "Success", message: "Event and reminder added to calendar!", viewController: viewController)
                                    }
                                } catch {
                                    if let viewController = self?.getVisibleViewController() {
                                        self?.showAlert(title: "Error", message: "Failed to save reminder to calendar: \(error.localizedDescription)", viewController: viewController)
                                    }
                                }
                            } catch {
                                if let viewController = self?.getVisibleViewController() {
                                    self?.showAlert(title: "Error", message: "Failed to save event to calendar: \(error.localizedDescription)", viewController: viewController)
                                }
                            }
                        }
                    }
                    alertController.addAction(addAction)
                    
                    // Add cancel action
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alertController.addAction(cancelAction)
                    
                    // Customize alert controller appearance
                    alertController.view.tintColor = .systemGreen
                    alertController.view.backgroundColor = .white
                    alertController.view.layer.cornerRadius = 10
                    
                    // Customize date picker appearance
                    datePicker.setValue(UIColor.systemGreen, forKey: "textColor")
                    
                    // Add padding to the top constraint of the alert controller's view
                    let paddingTop: CGFloat = 16
                    if let alertControllerView = alertController.view.subviews.first?.subviews.first {
                        alertControllerView.topAnchor.constraint(equalTo: alertControllerView.superview!.topAnchor, constant: paddingTop).isActive = true
                    }
                    
                    if let viewController = self?.getVisibleViewController() {
                        viewController.present(alertController, animated: true, completion: nil)
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
        paragraphStyle.lineSpacing = 4 // Add line spacing
        
        let messageAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray,
            .paragraphStyle: paragraphStyle
        ]
        let attributedMessage = NSAttributedString(string: "", attributes: messageAttributes)
        alertController.setValue(attributedMessage, forKey: "attributedMessage")
        
        // Create and add the date picker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        alertController.view.addSubview(datePicker)
        
        // Set date picker constraints
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 20 + 15), // Adjust top constraint value with padding
            datePicker.leadingAnchor.constraint(equalTo: alertController.view.leadingAnchor, constant: 20 + 15), // Adjust leading constraint value with padding
            datePicker.trailingAnchor.constraint(equalTo: alertController.view.trailingAnchor, constant: -20 - 15), // Adjust trailing constraint value with padding
            datePicker.bottomAnchor.constraint(equalTo: alertController.view.bottomAnchor, constant: -20 - 15) // Adjust bottom constraint value with padding
        ])
        
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
        
        // Configure cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor") // Change cancel action text color
        alertController.addAction(cancelAction)
        
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
            
            weekView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50), // Adjusted top constraint
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
        
        allWorkoutButton.setTitle("MARK")
        
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






