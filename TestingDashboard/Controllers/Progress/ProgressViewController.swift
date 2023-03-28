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
    
    // Setup Views
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerformanceView)
        view.setupView(monthlyPerformanceView)
    }
    
    // Configure Appearance
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    // constaintViews
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
        
        // Daily Performance View
        dailyPerformanceView.configure(with: [.init(value: "D1", heightMultiplier: 1.0, title: "MON"),
                                              .init(value: "D2", heightMultiplier: 0.4, title: "TUE"),
                                              .init(value: "D3", heightMultiplier: 0.6, title: "WED"),
                                              .init(value: "D4", heightMultiplier: 0.8, title: "THU"),
                                              .init(value: "D5", heightMultiplier: 1, title: "FRI"),
                                              .init(value: "D6", heightMultiplier: 0.6, title: "SAT"),
                                              .init(value: "D7", heightMultiplier: 0.4, title: "SUN")])
        
        monthlyPerformanceView.configure(with: [.init(value: "D1", heightMultiplier: 1.0, title: "MON"),
                                                .init(value: "D2", heightMultiplier: 0.4, title: "TUE"),
                                                .init(value: "D3", heightMultiplier: 0.6, title: "WED"),
                                                .init(value: "D4", heightMultiplier: 0.8, title: "THU"),
                                                .init(value: "D5", heightMultiplier: 1, title: "FRI"),
                                                .init(value: "D6", heightMultiplier: 0.6, title: "SAT"),
                                                .init(value: "D7", heightMultiplier: 0.4, title: "SUN")])
     
    }
}
