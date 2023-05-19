//
//  ProgressViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

class ProgressBaseController: BaseController {

    // Daily PerformanceView
    private let dailyPerformanceView = DailyPerformanceView(with: "Daily Perfomance",
                                                            buttonTitle: "Refresh")
    // Monthly Performance View
    private let monthlyPerformanceView = MonthlyPerformanceView(with: "Recent 15 Performances",
                                                                buttonTitle: "Refresh")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a container view to hold the titleLabel
        let containerView = UIView()

        // Create a custom UILabel for the navigation title
        let titleLabel = UILabel()
        titleLabel.text = "Progress"
        titleLabel.textColor = UIColor.red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)

        // Add the titleLabel to the containerView
        containerView.addSubview(titleLabel)

        // Apply constraints to position the titleLabel within the containerView
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -30)
        ])

        // Set the containerView as the titleView of the navigation item
        navigationItem.titleView = containerView

    }
}

extension ProgressBaseController {
    
    // MARK: Setup Views
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerformanceView)
        view.setupView(monthlyPerformanceView)
        
    }
    
   
    // MARK: Configure Appearance
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    // MARK: Constraints
    override func constaintViews() {
        super.constaintViews()
        
        
        NSLayoutConstraint.activate([
            // Daily Performance View
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.5), // Adjust the multiplier as needed

            // Monthly Performance View
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 0.9), // Adjust the multiplier as needed
        ])

        // MARK: Daily Perfromance View

        APICaller.shared.loadProgress { results in
            DispatchQueue.main.async {
                if results.count > 0 {
                    let currentDate = Date() // Get the current date
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let currentDateString = dateFormatter.string(from: currentDate)
                    
                    for (index, user) in results.enumerated() {
                        if user.date.hasPrefix(currentDateString) {
                            let title = "\(index + 1)" // Customize the title to display the number
                            
                            self.dailyPerformanceView.configure(with: [
                                .init(value: String(user.dailyCount), heightMultiplier: Double(user.dailyCount) / 1000, title: title)
                            ])
                        }
                    }
                } else {
                    print("No results found")
                }
            }
        }



        APICaller.shared.loadProgress { results in
            DispatchQueue.main.async {
                if results.count > 0 {
                    let startIndex = max(0, results.count - 15) // Calculate the starting index
                    
                    for (index, user) in results.enumerated().suffix(15).enumerated() {
                        let title = "\(index + 1)" // Customize the title to display the number
                        
                        self.monthlyPerformanceView.configure(with: [
                            .init(value: String(user.element.dailyCount), heightMultiplier: Double(user.element.dailyCount) / 550, title: title)
                        ])
                    }
                } else {
                    print("No results found")
                }
            }
        }

     
    }
}
