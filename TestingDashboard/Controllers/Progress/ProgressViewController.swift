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
        view.backgroundColor = .white
        title = "Progress"
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
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),

            // Monthly Performance View
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06),

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
