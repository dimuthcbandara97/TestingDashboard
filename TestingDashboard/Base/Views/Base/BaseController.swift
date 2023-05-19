////
////  BaseController.swift
////  TestingDashboard
////
////  Created by Dimuth Bandara on 2023-03-13.
////
//
//
//import UIKit
//import UserNotifications
//
//enum NavBarPosition {
//    case Left
//    case Right
//}
//
//class BaseController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            UNUserNotificationCenter.current().delegate = appDelegate as? any UNUserNotificationCenterDelegate
//        }
//
//        setupViews()
//        constaintViews()
//        configureAppearance()
////        checkForPermission()
//
//    }
//
//    func checkForPermission() {
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.getNotificationSettings { settings in
//            switch settings.authorizationStatus {
//            case .authorized:
//                self.dispatchNotification()
//            case .denied:
//                return
//            case .notDetermined:
//                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
//                    if didAllow {
//                        self.dispatchNotification()
//                    }
//                }
//            default:
//                return
//            }
//        }
//    }
//
//    func dispatchNotification() {
//        let identifier = "Your Time Table"
//        let title = "Testing Title"
//        let body = "Testing Body"
//        let hour = 08
//        let minute = 56
//        let isDaily = true
//
//        let notificationCenter = UNUserNotificationCenter.current()
//
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = .default
//
//        let calendar = Calendar.current
//        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
//        dateComponents.hour = hour
//        dateComponents.minute = minute
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//
//        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
//
//        notificationCenter.add(request)
//    }
//
//}
//
//@objc extension BaseController {
//    func setupViews() {
//        // Placeholder implementation for setting up views
//        // Add your code to set up your custom views in this function
//    }
//
//    func constaintViews() {
//        // Placeholder implementation for setting up view constraints
//        // Add your code to add constraints to your views in this function
//    }
//
//    func configureAppearance() {
//        view.backgroundColor = .white
//    }
//
//    func navBarLeftButtonHandler() {
//        print("NavBar Left button tapped")
//    }
//
//    func navBarRightButtonHanler() {
//        print("NavBar Right button tapped")
//    }
//}
//
//extension BaseController {
//
//    func addNavBarButton(at position: NavBarPosition, with title: String) {
//        let button = UIButton(type: .system)
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.setTitleColor(.red, for: .disabled)
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 5
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.gray.cgColor
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        button.tintColor = .white
//
//        let buttonWidth: CGFloat = 80 // Adjust the button width as needed
//        let buttonHeight: CGFloat = 40 // Adjust the button height as needed
//
//        let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight))
//        buttonView.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        let topOffset: CGFloat = -35 // Adjust the top offset as needed
//
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
//            button.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: topOffset),
//            button.widthAnchor.constraint(equalTo: buttonView.widthAnchor),
//            button.heightAnchor.constraint(equalTo: buttonView.heightAnchor)
//        ])
//
//        switch position {
//        case .Left:
//            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
//            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonView)
//        case .Right:
//            button.addTarget(self, action: #selector(navBarRightButtonHanler), for: .touchUpInside)
//            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonView)
//        }
//
//
//    }
//
//}
//
//extension UIView {
//    func pin(to superView: UIView) {
//        translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            topAnchor.constraint(equalTo: superView.topAnchor),
//            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
//            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
//            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
//        ])
//    }
//}
//
//  BaseController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

//import UIKit
//import UserNotifications
//
//enum NavBarPosition {
//    case Left
//    case Right
//}
//
//class BaseController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        constaintViews()
//        configureAppearance()
//        checkForPermission()
//        dispatchNotification()
//    }
//    func checkForPermission() {
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.getNotificationSettings { settings in
//            switch settings.authorizationStatus {
//            case .authorized:
//                self.dispatchNotification()
//            case .denied:
//                return
//            case .notDetermined:
//                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
//                    if didAllow {
//                        self.dispatchNotification()
//                    }
//                }
//            default:
//                return
//            }
//        }
//    }
//
//    func dispatchNotification() {
//        let identifier = "Your Time Table"
//        let title = "Testing Title"
//        let body = "Testing Body"
//        let hour = 13
//        let minute = 28
//        let isDaily = true
//
//        let notificationCenter = UNUserNotificationCenter.current()
//
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = .default
//
//        let calendar = Calendar.current
//        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
//        dateComponents.hour = hour
//        dateComponents.minute = minute
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//
//        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
//
//        notificationCenter.add(request)
//    }
//
//}
//
//@objc extension BaseController {
//
//    func setupViews(){}
//    func constaintViews(){}
//    func configureAppearance(){
//    view.backgroundColor = .white
//
//    }
//
//    func navBarLeftButtonHandler(){ print("NavBar Lefight button tapped") }
//    func navBarRightButtonHanler(){ print("NavBar Right button tapped") }
//}
//
//
//
//extension BaseController {
//
//    func addNavBarButton(at position: NavBarPosition, with title: String) {
//
//        let button = UIButton(type: .system)
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.setTitleColor(.red, for: .disabled)
////        button.tintColor = .systemPink
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 5
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.gray.cgColor
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        button.tintColor = .white
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
////        button.titleLabel?.highlightedFont = UIFont.systemFont(ofSize: 18, weight: .bold)
//
//        switch position {
//        case .Left:
//            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
//            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
//        case .Right:
//            button.addTarget(self, action: #selector(navBarRightButtonHanler), for: .touchUpInside)
//            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
//        }
//    }
//}
//
//extension UIView {
//    func pin(to superView: UIView){
//        translatesAutoresizingMaskIntoConstraints = false
//        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
//        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
//        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
//        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
//    }
//}
import UIKit
import UserNotifications

enum NavBarPosition {
    case Left
    case Right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        constaintViews()
        configureAppearance()
    }
    
}

@objc extension BaseController {
    func setupViews() {
        // Placeholder implementation for setting up views
        // Add your code to set up your custom views in this function
    }
    
    func constaintViews() {
        // Placeholder implementation for setting up view constraints
        // Add your code to add constraints to your views in this function
    }
    
    func configureAppearance() {
        view.backgroundColor = .white
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar Left button tapped")
    }
    
    func navBarRightButtonHanler() {
        print("NavBar Right button tapped")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.red, for: .disabled)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .white
        
        switch position {
        case .Left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .Right:
            button.addTarget(self, action: #selector(navBarRightButtonHanler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
