//
//  SessionViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit
import SwiftKeychainWrapper

final class SessionBaseController: BaseController {
    
    private let timerView = TimerView()
    private let statsView = StatsView(with: "STANDARD RATES")
    private let progress2View = Progress2View(with: "YOUR HEALTH")
    
    private var timerDuration = 30
    
    // MARK: Left Button
    override func navBarLeftButtonHandler() {
        
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        addNavBarButton(
            at: .Left,
            with: timerView.state == .isRuning
            ? "PAUSE" : "START"
        )
    }
    
    // MARK: Right Button
    override func navBarRightButtonHanler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        addNavBarButton(at: .Left, with: "START")
    }
}

extension SessionBaseController {
    
    // MARK: Setup Views
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(progress2View)
        view.backgroundColor = .white
        
        
    }
    
    // MARK: Constraints
    override func constaintViews() {
        
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5), // Adjust the constant as needed
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4), // Adjust the multiplier as needed
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 5), // Adjust the constant as needed
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            progress2View.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            progress2View.topAnchor.constraint(equalTo: statsView.topAnchor),
            progress2View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            progress2View.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
        
        
        
    }
    
    // MARK: Show Alert
    func showAlert() {
        let alert = UIAlertController(title: "Your Time is UP", message: "You have completed your exercise", preferredStyle: .alert)
        
        // Customize alert title appearance
        let titleFont = UIFont.boldSystemFont(ofSize: 20)
        let titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: UIColor.red]
        let attributedTitle = NSAttributedString(string: "Your Time is UP", attributes: titleAttributes)
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        
        // Customize alert message appearance
        let messageFont = UIFont.systemFont(ofSize: 17)
        let messageAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: messageFont, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        let attributedMessage = NSAttributedString(string: "You have completed 30 seconds of exercise", attributes: messageAttributes)
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: Configure Appearance
    override func configureAppearance() {
        
        super.configureAppearance()
        
        timerView.configure(with: Double(timerDuration), progress: 0)
        
        //        title = OverallController.Strings.NavBar.session?
        title = " Loading Your Timer"
        navigationController?.tabBarItem.title = OverallController.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .Left, with: "START")
        addNavBarButton(at: .Right, with: "FINISH")
        
        let keychain = KeychainWrapper.standard
        
        func getEmailUser() -> String? {
            return keychain.string(forKey: "UserEmail")
        }
        
        timerView.configure(with: Double(timerDuration), progress: 0)
        timerView.callBack = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.navBarRightButtonHanler()
                
                let calendar = Calendar.current
                let currentDate = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Updated date format
                
                let formattedDate = formatter.string(from: currentDate)
                let currentMonth = calendar.component(.month, from: currentDate)
                
                let progress = ProgressElement(progressName: "Progress", dailyCount: 30, date: formattedDate, month: currentMonth, email: getEmailUser() ?? "dimuthcbandara97@gmail.com")
                
                APICaller.shared.insertProgress(progresss: progress) { success, error in
                    if let error = error {
                        print("API call failed with error: \(error.localizedDescription)")
                        return
                    }
                    if success {
                        print("API call successful")
                        // self.showAlert()
                    } else {
                        print("API call failed")
                    }
                }
                self.showAlert()
            }
        }
        
        
        // MARK: Keychain Values
        
        func getUserDetailsHeight() -> Int? {
            return keychain.integer(forKey: "userDetailsHeight")
        }
        
        func getUserDetailsWeight() -> Int? {
            return keychain.integer(forKey: "userDetialsWeight")
        }
        
        func getUserDetailsAge() -> Int? {
            return keychain.integer(forKey: "userDetialsAge")
        }
        
        func calculateBMI(height: Int, weight: Int) -> String {
            let heightInMeters = Double(height) / 100.0 // Convert height to meters
            let bmi = Double(weight) / (heightInMeters * heightInMeters) // Calculate BMI using the formula
            
            let formattedBMI = String(format: "%.4f", bmi)
            return formattedBMI
        }
        
        // MARK: Progress View (Sensors)
        let userDetailsHeight = getUserDetailsHeight() ?? 0
        let userDetailsWeight = getUserDetailsWeight() ?? 0
        let bmi = calculateBMI(height: userDetailsHeight, weight: userDetailsWeight)
        
        progress2View.configure(with: [
            .topic01(value: "\(getUserDetailsAge() ?? 0)"),
            .topic02(value: "\(getUserDetailsHeight() ?? 0)"),
            .topic03(value: "\(getUserDetailsWeight() ?? 0)"),
            .topic04(value: "\(bmi)")
        ])
        
        // MARK: From API
        APICaller.shared.loadStats { results in
            DispatchQueue.main.async {
                self.statsView.configure(with: [.topic01(value: results[0].bloodpressure),
                                                .topic02(value: results[0].heartrate),
                                                .topic03(value: results[0].bmi),
                                                .topic04(value: results[0].bodyfat)])
            }
        }
        
        
        func getUserDetailsFitnessGoal() -> String? {
            return keychain.string(forKey: "userDetailsFitnessGoal")
        }
        
        print(getUserDetailsFitnessGoal())
        
        APICaller.shared.loadExercise { results in
            DispatchQueue.main.async {
                if results.count > 0 {
                    for user in results {
                        if user.fitnessGoal == getUserDetailsFitnessGoal() {
                            print(user.exerciseName)
                            print(user.repCount)
                            print(user.exerciseTime)
                            
                            // Update the timerDuration value
                            self.timerDuration = user.exerciseTime
                            self.timerView.configure(with: Double(self.timerDuration), progress: 0)
                        }
                    }
                } else {
                    print("No results found")
                }
            }
        }
        
    }
}

