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
                                                            buttonTitle: "Some Days")
    // Monthly Performance View
    private let monthlyPerformanceView = MonthlyPerformanceView(with: "Monthly Performance",
                                                                buttonTitle: "This Month")
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
                    
                    for user in results {
                        if user.date.hasPrefix(currentDateString) {
                            self.dailyPerformanceView.configure(with: [
                                .init(value: String(user.dailyCount), heightMultiplier: Double(user.dailyCount) / 100, title: "Day")
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
                    let currentDate = Date() // Get the current date
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
//                    let currentDateString = dateFormatter.string(from: currentDate)
                    
                    for user in results  {
                            self.monthlyPerformanceView.configure(with: [
                                                                    .init(value: String(user.dailyCount), heightMultiplier: Double(user.dailyCount) / 100, title: "Week")])
                        
                    }
                } else {
                    print("No results found")
                }
            }
        }
     
    }
}
